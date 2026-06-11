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
    unstable.pi-coding-agent
    unstable.opencode

    # JavaScript
    nodejs

    # # Python
    python313

    # # Rust
    rustc
    rustup
    cargo

    # # Cpp
    gcc
    clang-tools
  ];
}
