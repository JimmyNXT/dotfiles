{ pkgs, ... }: {
  programs.nix-ld.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow insecure packages (e.g., old Docker)
  nixpkgs.config.permittedInsecurePackages = [ "docker-28.5.2" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];


}
