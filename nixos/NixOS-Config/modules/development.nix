{ ... }: {
  flake.nixosModules.development = { pkgs, unstable, ... }: {
    environment.systemPackages = with pkgs; [
      git

      # Debugging
      gdb
      gf

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

      # Databases
      dbeaver-bin

      # Network Debugging
      wireshark
    ];
    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
  };
}
