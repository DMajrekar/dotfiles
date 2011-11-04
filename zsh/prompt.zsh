autoload colors && colors

# Checks if working tree is dirty
parse_git_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "*"
  else
    echo ""
  fi
}

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/}$(parse_git_dirty)) "
}

precmd() {
  PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%#%{$reset_color%} "
}
