{ lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        builtin_box_drawing = true;
        size = 9.0;
        normal = {
          style = lib.mkForce "Bold";
        };
      };
    };
  };
}
