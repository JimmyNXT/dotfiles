{ ... }: {
  flake.nixosModules.vscode = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          # Nix
          jnoortheen.nix-ide

          # Python
          ms-python.python
        ];
      })
    ];
  };
}
