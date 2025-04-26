{ pkgs, ... }:{
    services.xserver = {
        enable = true;
        layout = "us";
        libinput = {
          enable = true;
          disableWhileTyping = true;
          naturalScrolling = true;
          additionalOptions = ''
            Option "PalmDetection" "True"
          '';
        };

        
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

        desktopManager = {
            # default = "none";
            xterm.enable = false;
        };
        # displayManager.auto = { 
        #     # enable = true; 
        #     user = "jimmynxt"; 
        #     lightdm = {
        #         enable = true;
        #         greeter.enable = false;
        #         autoLogin.enable = true;
        #         autoLogin.user = "jimmynxt";
        #     };
        # };
    };
}