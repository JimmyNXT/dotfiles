{ ... }: {
  flake.nixosModules.hexeditor = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      hexyl
      hexedit
    ];
  };
}
