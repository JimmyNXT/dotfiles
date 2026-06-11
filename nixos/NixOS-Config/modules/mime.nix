{ ... }: {
  flake.nixosModules.mime = {
    xdg.mime.defaultApplications = {
      "inode/directory" = "ranger";
    };
  };
}
