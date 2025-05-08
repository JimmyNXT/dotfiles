{ pkgs, ... }:{
    xsession.enable = true;
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
    };
    
    home.file = {
    ".config/i3" = {
      source = ../../../i3/.config/i3;
      recursive = true;
    };
  };
}