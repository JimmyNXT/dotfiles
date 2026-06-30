{ ... }: {
  flake.nixosModules.opencode = { pkgs, unstable, ... }: {
    environment.systemPackages = with pkgs; [
      unstable.opencode
    ];
  };
}
