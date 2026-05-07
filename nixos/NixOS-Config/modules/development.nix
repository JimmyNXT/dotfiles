{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pi-coding-agent

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
