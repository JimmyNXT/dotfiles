{ ... }: {
  flake.nixosModules.timezone = {
    time.timeZone = "Africa/Johannesburg";
  };
}
