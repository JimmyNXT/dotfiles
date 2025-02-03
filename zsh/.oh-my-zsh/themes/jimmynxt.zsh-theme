# PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+=' $(git_prompt_info)'
prompt_text='%F{%(#.cyan.green)}┌──$'
prompt_text+='{debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}'
prompt_text+='(%B%F{%(#.red.cyan)}%n'$prompt_symbol$'%m%b%F{%(#.cyan.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.cyan.green)}]$(git_prompt_info)\n└─%B%(#.%F{red}#.%F{cyan}>)%b%F{reset} '

PROMPT=$prompt_text

ZSH_THEME_GIT_PROMPT_PREFIX="-%{$fg_bold[blue]%}{%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%F{%(#.cyan.green)}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
