{ pkgs, ... }:{
    programs.zsh = {
        enable = true;
    };

    home.file = {
        ".zshrc" = {
            source = ../../../../zsh/.zshrc;
        };
    };
}