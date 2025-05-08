{
  programs.git = {
    enable = true;
    # userName = "JimmyNXT";
    # userEmail = "dminnie33@gmail.com";
  };

  home.file = {
    ".gitconfig" = {
      source = ../../../git/.gitconfig;
    };
  };
}
