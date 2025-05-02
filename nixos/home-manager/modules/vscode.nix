{ pkgs, ... }:{
  programs.vscode ={
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs; [
      vscode-extensions.bbenoist.nix
      vscode-extensions.ms-vscode.cpptools
      vscode-extensions.ms-vscode.cmake-tools
      vscode-extensions.ms-python.python
      vscode-extensions.ms-python.black-formatter
      vscode-extensions.ms-python.debugpy
      # vscode-extensions.platformio.platformio-vscode-ide
    ];
  };
}
