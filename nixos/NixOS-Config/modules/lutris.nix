{ ... }: {
  flake.nixosModules.lutris = { pkgs, lib, config, ... }: {

    environment.systemPackages = with pkgs; [
      # Lutris — game manager / launcher
      lutris
      # Wine staging WoW64 (recommended for gaming) with full 32/64-bit support
      wineWow64Packages.staging
      # Winetricks — helper to install Windows components (dotnet40, vcrun2015, d3dx9)
      winetricks
      # DXVK — DirectX 9-11 to Vulkan translation (huge performance boost)
      dxvk
      # Vulkan loader (required by DXVK)
      vulkan-loader
    ];

    # Enable graphics drivers + Vulkan (required by DXVK)
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vulkan-loader
      ];
    };

    # Enable 32-bit audio for Wine if PulseAudio or PipeWire is in use
    services.pulseaudio.support32Bit = config.services.pulseaudio.enable;
    services.pipewire.alsa.support32Bit = config.services.pipewire.alsa.enable;

    # Support for game controllers (udev rules)
    hardware.steam-hardware.enable = lib.mkDefault true;

  };
}
