{ ... }: {
  flake.nixosModules.drone = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mission-planner
    ];
  };
}
