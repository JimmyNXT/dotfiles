{ ... }: {
  home.file."vale.ini" = {
    source = ../../../vale/vale.ini;
    force = true;
  };

  home.file.".vale-styles" = {
    source = ../../../vale/.vale-styles;
    force = true;
  };
}
