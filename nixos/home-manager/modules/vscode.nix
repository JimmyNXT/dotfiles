{ pkgs, pkgs-unstable, ... }:{
  programs.vscode ={
    enable = true;
    package = pkgs.vscode;
    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.ms-vscode.cpptools
      pkgs.vscode-extensions.ms-vscode.cmake-tools
      pkgs.vscode-extensions.ms-python.python
      pkgs.vscode-extensions.ms-python.black-formatter
      pkgs.vscode-extensions.ms-python.debugpy
      pkgs-unstable.vscode-extensions.platformio.platformio-vscode-ide
    ];
    userSettings = {
      "git.autofetch" = true;
      "explorer.confirmDelete" = false;
      "platformio-ide.useBuiltinPIOCore" = false;
      "platformio-ide.useBuiltinPython" = false;
      "platformio-ide.customPATH" = "$PATH";
      "platformio-ide.forceSystemPIOCore" = true;
      "platformio-ide.forceSystemPython" = true;
    };
  };
}
