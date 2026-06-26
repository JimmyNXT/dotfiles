{ ... }: {
  flake.nixosModules.i3 = { pkgs, ... }: {
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "za";
          variant = "";
        };

        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            i3status
            i3lock
            i3blocks
            rofi
            picom
            ghostty
            thunar
          ];
        };

        desktopManager = {
          xterm.enable = false;
        };
      };
      displayManager = {
        defaultSession = "none+i3";
      };

      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = false;
          disableWhileTyping = true;
          additionalOptions = ''
            Option "PalmDetection" "True"
          '';
        };

      };

      # displayManager.sddm.enable = true;
    };
    security.pam.services = {
      # Depending on which screen locker you are using, as per
      # https://github.com/NixOS/nixpkgs/pull/399051/files#diff-aef862f6fd2c25092a3f17f974d8757285bf7baff6b80822cd142b7de1903ccfR444
      i3lock.enable = true;
      i3lock-color.enable = true;
      xlock.enable = true;
      xscreensaver.enable = true;
    };

    environment.systemPackages = with pkgs; [ capitaine-cursors ];

    environment.sessionVariables = {
      TERMINAL = "ghostty";
      XCURSOR_THEME = "capitaine-cursors";
      XCURSOR_SIZE = "24";
    };
  };
}
