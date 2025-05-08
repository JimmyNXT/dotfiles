{ pkgs, ... }:{
    # programs.zsh.oh-my-zsh = {
    #     enable = true;
    # };

    home.file = {
        ".oh-my-zsh" = {
            source = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
            recursive = true;
        };
        ".oh-my-zsh/themes/jimmynxt.zsh-theme" = {
            source = ../../../../zsh/.oh-my-zsh/themes/jimmynxt.zsh-theme;
        };
    };

}