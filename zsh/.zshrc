#
# Locale
#

export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

#
# Editor
#

export VISUAL=vim
export EDITOR=$VISUAL
export PAGER=less

#
# Browser
#

export BROWSER='open'

#
# Key Bindings
#

bindkey -e
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

#
# antidote - Zsh Plugin Manager
#

source ~/.antidote/antidote.zsh

antidote load

#
# Prompt
#

autoload -Uz promptinit && promptinit && prompt pure
