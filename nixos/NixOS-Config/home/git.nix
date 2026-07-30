{ lib, ... }: {
  home.activation.seedGitSettings = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    if [ ! -f "$HOME/.gitconfig" ]; then
      cp -f ${../../../git/.gitconfig} "$HOME/.gitconfig"
      chmod 644 "$HOME/.gitconfig"
    fi

    if [ ! -f "$HOME/.gitconfig-work" ]; then
      cp -f ${../../../git/.gitconfig-work} "$HOME/.gitconfig-work"
      chmod 644 "$HOME/.gitconfig-work"
    fi
  '';
}
