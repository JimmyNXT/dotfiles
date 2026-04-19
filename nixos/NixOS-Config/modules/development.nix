{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cargo
    docker
    gdb
    gf
    git
    nodejs
    python3
    rustc
    rustup
  ];
}
