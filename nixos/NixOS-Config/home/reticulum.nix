{ ... }: {
  home.file.".nomadnetwork/config" = {
    source = ../../../reticulum/.nomadnetwork/config;
    force = true;
  };

  home.file.".reticulum/config" = {
    source = ../../../reticulum/.reticulum/config;
    force = true;
  };
}
