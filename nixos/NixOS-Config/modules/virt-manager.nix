{ ... }: {
  flake.nixosModules.virt-manager = { config, pkgs, lib, ... }: {
    programs.virt-manager = {
      enable = true;
    };
    virtualisation = {
      libvirtd = {
        enable = true;
        onBoot = "ignore";
        allowedBridges = [ "br0" "virbr0" ];
      };
      spiceUSBRedirection.enable = true;
    };

    # Wait for data drives to be mounted before starting libvirtd.
    # Uses "wants" (not "requires") so libvirtd still starts even if
    # a drive is absent (nofail) or fails to mount.
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

    # # Define and autostart the libvirt bridge network that uses the host bridge br0.
    # # This makes "bridge" appear as a named network in virt-manager.
    # systemd.services.libvirtd-bridge = {
    #   description = "Define the libvirt bridge network for br0";
    #   after = [ "libvirtd.service" ];
    #   bindsTo = [ "libvirtd.service" ];
    #   wantedBy = [ "libvirtd.service" ];
    #   serviceConfig = {
    #     Type = "oneshot";
    #     RemainAfterExit = true;
    #   };
    #   script = ''
    #     XML_PATH="/var/lib/libvirt/qemu/networks/bridge.xml"
    #     cat > "$XML_PATH" << 'EOF'
    #     <network>
    #       <name>bridge</name>
    #       <forward mode="bridge" />
    #       <bridge name="br0" />
    #     </network>
    #     EOF
    #
    #     if ! ${pkgs.libvirt}/bin/virsh net-info bridge >/dev/null 2>&1; then
    #       ${pkgs.libvirt}/bin/virsh net-define "$XML_PATH"
    #       ${pkgs.libvirt}/bin/virsh net-autostart bridge
    #     fi
    #   '';
    # };

    # programs.dconf.settings = {
    #     "org/virt-manager/virt-manager/connections" = {
    #         autoconnect = ["qemu:///system"];
    #         uris = ["qemu:///system"];
    #     };
    # };
  };
}
