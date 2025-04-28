{ pkgs, ... }:{
    services = {
      xserver = {
        enable = true;
        xkb.layout = "us";
        
        windowManager = {
            # default = "i3";
            i3.enable = true;
            i3.package = pkgs.i3-gaps;
            i3.extraPackages = with pkgs; [
                dmenu
                i3lock
                i3status
                i3-gaps
            ];
        };
      };
      libinput = {
          enable = true;
          touchpad = {
            naturalScrolling = true;
            disableWhileTyping = true;
            additionalOptions = ''
              Option "PalmDetection" "True"
            '';
          };
          
        };
    };
}
