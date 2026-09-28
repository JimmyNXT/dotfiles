{ ... }: {
  flake.nixosModules.virt-manager =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.virt-manager = {
        enable = true;
      };
      virtualisation = {
        libvirtd = {
          enable = true;
          onBoot = "ignore";
          allowedBridges = [
            "br0"
          ];
        };
        spiceUSBRedirection.enable = true;
      };

      systemd.services.libvirtd = {
        after = [
          "VM-Data.mount"
          "AI-Data.mount"
        ];
        wants = [
          "VM-Data.mount"
          "AI-Data.mount"
        ];
      };
    };
}
