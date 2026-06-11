{ pkgs, ... }:
{
  fonts = {
    packages = [
      pkgs.nerd-fonts.sauce-code-pro
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [ "SauceCodePro Nerd Font" ];
      };
    };
  };
}
