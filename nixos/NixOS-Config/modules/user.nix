{ ... }: {
  flake.nixosModules.user = { pkgs, ... }: {
    programs.firefox.enable = true;

    users = {
      defaultUserShell = pkgs.zsh;
      users.jimmynxt = {
        useDefaultShell = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
          "dialout"
          "docker"
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
