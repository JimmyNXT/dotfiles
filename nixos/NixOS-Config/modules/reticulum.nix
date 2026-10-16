{ inputs, ... }: {
  flake.nixosModules.reticulum = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.reticulum.packages.${pkgs.stdenv.hostPlatform.system}.reticulum-stack
    ];
    networking.firewall.allowedUDPPorts = [
      29716
      42671
    ];
  };
}
