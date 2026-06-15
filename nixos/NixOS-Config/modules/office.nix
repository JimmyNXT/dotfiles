{ ... }: {
  flake.nixosModules.office = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en-gb-large
    ];

    system.activationScripts.libreoffice-colibre = let
      user = "jimmynxt";
      home = "/home/${user}";
      xcuPath = "${home}/.config/libreoffice/4/user/registrymodifications.xcu";
    in ''
      LO_DIR="${home}/.config/libreoffice/4/user"
      mkdir -p "$LO_DIR"

      if ! grep -q 'IconTheme.*Colibre' "${xcuPath}" 2>/dev/null; then
        cat >> "${xcuPath}" << 'XEU_EOF'
    <?xml version="1.0" encoding="UTF-8"?>
    <oor:items xmlns:oor="http://openoffice.org/2001/registry" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <item oor:path="/org.openoffice.Office.Views/Look/Optional"><prop oor:name="IconTheme" oor:op="fuse"><value>Colibre</value></prop></item>
    </oor:items>
    XEU_EOF
      fi

      chown -R ${user}:users "$LO_DIR"
    '';
  };
}
