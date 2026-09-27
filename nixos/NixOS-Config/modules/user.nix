{ ... }: {
  flake.nixosModules.user = { pkgs, ... }: {
    programs.firefox.enable = true;

    users = {
      defaultUserShell = pkgs.zsh;
      users.jimmynxt = {
        # useDefaultShell = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [
          "adbusers"
          "dialout"
          "docker"
          "kvm"
          "libvirtd"
          "networkmanager"
          "video"
          "wheel"
          "wireshark"
        ];
        packages = with pkgs; [
          virt-manager
          xca
          rpi-imager
        ];
      };
    };
  };
}
