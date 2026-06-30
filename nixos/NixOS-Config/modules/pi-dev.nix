{ ... }: {
  flake.nixosModules.pi-dev = { pkgs, unstable, ... }: {
    environment.systemPackages = with pkgs; [
      unstable.pi-coding-agent
    ];
  };
}
