{ ... }: {
  flake.nixosModules.mime = { pkgs, ... }: {
    xdg.mime.enable = true;
    xdg.mime.defaultApplications = {
      "inode/directory" = "thunar.desktop";
      # "application/vnd.jgraph.mxfile" = "drawio.desktop";
    };
    #     environment.systemPackages = [
    #       # Register .drawio extension with its MIME type
    #       (pkgs.runCommand "mime-drawio" { } ''
    #         mkdir -p $out/share/mime/packages
    #         cat > $out/share/mime/packages/drawio.xml <<'EOF'
    # <?xml version="1.0" encoding="UTF-8"?>
    # <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    #   <mime-type type="application/vnd.jgraph.mxfile">
    #     <comment>Draw.io diagram</comment>
    #     <glob pattern="*.drawio"/>
    #   </mime-type>
    # </mime-info>
    # EOF
    #       '')
    # ];
  };
}
