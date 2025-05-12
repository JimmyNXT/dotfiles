{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
    kdePackages.konsole
    base16-schemes
  ];
}