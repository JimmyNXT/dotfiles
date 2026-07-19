{ lib, ... }: {
  home.file.".pi/agent/models.json" = {
    source = ../../../pi/.pi/agent/models.json;
    force = true;
  };

  home.activation.seedPiSettings = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    if [ ! -f "$HOME/.pi/agent/settings.json" ]; then
      mkdir -p "$HOME/.pi/agent"
      cp -f ${../../../pi/.pi/agent/settings.json} "$HOME/.pi/agent/settings.json"
      chmod 644 "$HOME/.pi/agent/settings.json"
    fi
  '';
}
