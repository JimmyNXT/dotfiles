{ ... }: {
  flake.nixosModules.flightgear = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      flightgear
    ];
  };
}
