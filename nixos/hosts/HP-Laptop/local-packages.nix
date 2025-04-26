{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
    # gcc
    # kdenlive
    # jetbrains.pycharm-professional
    # jre8
    qemu
    # quickemu
  ];
}
