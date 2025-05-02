{ pkgs, config, home, ... }:

{
  home = {
    packages = with pkgs; [
      nemo-with-extensions
    ];
  };

  services = {
    udiskie = {
      enable = true;
      settings = {
        # workaround for # https://github.com/nix-community/home-manager/issues/632
        program_options = {
          # replace with your favorite file manager
          file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
        };
      };
    };
  };
}

# {
#   services.udiskie = {
#     enable = true;
#     automount = true;
#     notify = true;
#     settings = {
#         # workaround for
#         # https://github.com/nix-community/home-manager/issues/632
#         program_options = {
#             # replace with your favorite file manager
#             file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
#         };
#     };
#   };
# }
