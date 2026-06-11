{ ... }: {
  flake.nixosModules.vscode = { pkgs, ... }: {
    # programs.nix-ld.enable = true;
    # programs.nix-ld.libraries = with pkgs; [avrdude];
    services.udev.packages = [
      pkgs.platformio-core
      pkgs.openocd
    ];
  };
}

