{ pkgs, ... }:
let
  unstable = import (fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz") { };
in
{
  environment.systemPackages = with pkgs; [
    git
    docker

    # Debugging

    gdb
    gf

    # AI
    pi-coding-agent
    unstable.opencode
    
    # JavaScript
    nodejs

    # # Python
    # python3

    # # Rust
    # rustc
    # rustup
    # cargo
  ];
}
