{ ... }: {
  flake.nixosModules.development = { pkgs, unstable, ... }: {
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

      # Python
      python313

      # Rust
      rustc
      rustup
      cargo

      # Cpp
      gcc
      clang-tools
    ];
  };
}
