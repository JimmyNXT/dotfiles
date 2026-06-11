{ ... }: {
  flake.nixosModules.udisk2 = {
    services.devmon.enable = true;
    services.udisks2.enable = true;
    services.gvfs.enable = true;
  };
}
