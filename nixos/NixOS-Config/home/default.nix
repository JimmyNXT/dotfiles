{ config, pkgs, ... }:
let
  # Auto-import all .nix files in this directory (dendritic pattern)
  dir = ./.;
  files = builtins.readDir dir;
  moduleFiles = builtins.filter
    (f: f != "default.nix" && builtins.match ".*\\.nix" f != null)
    (builtins.attrNames files);
in {
  imports = map (f: ./. + "/${f}") moduleFiles;

  home = {
    username = "jimmynxt";
    homeDirectory = "/home/jimmynxt";
    stateVersion = "25.11";
  };

  # Fonts
  fonts.fontconfig.enable = true;

  # Programs
  programs = {
    home-manager.enable = true;
    bash.enable = true;
  };
}
