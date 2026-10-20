{ ... }: {
  flake.nixosModules.iPhone = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libimobiledevice
      ifuse
      gvfs
    ];
    services.usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd;
    };
  };
}
