{ ... }: {
  home.file.".pi/agent/models.json" = {
    source = ../../../pi/.pi/agent/models.json;
    force = true;
  };

  home.file.".pi/agent/prompts" = {
    source = ../../../pi/.pi/agent/prompts;
    force = true;
  };
}
