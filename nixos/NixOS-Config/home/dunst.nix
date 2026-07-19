{ pkgs, ... }:
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        ### Display ###
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = "(0, 300)";
        origin = "top-right";
        offset = "(10, 50)";
        scale = 0;
        notification_limit = 20;

        ### Layout ###
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        ### Icons ###
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        enable_recursive_icon_lookup = true;

        ### History ###
        sticky_history = true;
        history_length = 20;

        ### Misc ###
        browser = "firefox-esr";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 8;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;

        ### Catppuccin Macchiato Theme ###
        background = "#24273A";
        foreground = "#CAD3F5";
        highlight = "#C6A0F6";
        frame_color = "#B7BDF8";
        frame_width = 2;
        separator_color = "frame";
        transparency = 10;
      };

      urgency_low = {
        background = "#24273A";
        foreground = "#A5ADCB";
        timeout = 5;
      };

      urgency_normal = {
        background = "#24273A";
        foreground = "#CAD3F5";
        timeout = 8;
      };

      urgency_critical = {
        background = "#24273A";
        foreground = "#CAD3F5";
        frame_color = "#ED8796";
        timeout = 0;
      };

      shortcuts = {
        close = "mod4+Shift+space";
        close_all = "mod4+Shift+Escape";
        history = "mod4+Shift+n";
        context = "mod4+Control+space";
      };

      # Per-app overrides for battery notifications
      "battery-monitor" = {
        appname = "battery-monitor";
        urgency = "critical";
        set_category = "battery";
      };
    };
  };

  home.packages = with pkgs; [
    libnotify        # notify-send for general popup notifications
  ];
}
