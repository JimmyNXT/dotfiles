{user}:{
    programs.virt-manager = {
        enable = true;
    };
    users.groups.libvirtd.members = ["${user}"];
    virtualisation = {
        libvirtd.enable = true;
        spiceUSBRedirection.enable = true;
    };

    programs.dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
    };
}