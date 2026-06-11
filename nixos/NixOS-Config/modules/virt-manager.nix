{ ... }: {
  flake.nixosModules.virt-manager = { ... }: {
    programs.virt-manager = {
      enable = true;
    };
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    # programs.dconf.settings = {
    #     "org/virt-manager/virt-manager/connections" = {
    #         autoconnect = ["qemu:///system"];
    #         uris = ["qemu:///system"];
    #     };
    # };
  };
}

