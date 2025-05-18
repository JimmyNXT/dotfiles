{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      useDefaultShell = true;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "libvirtd" "dialout"];
    };
  };
}
