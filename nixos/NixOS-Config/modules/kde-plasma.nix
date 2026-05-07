{ ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "za";
        variant = "";
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

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  environment = {
    sessionVariables = {
      TERMINAL = "konsole";
    };
  };
}
