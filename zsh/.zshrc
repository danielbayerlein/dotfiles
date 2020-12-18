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
# zplug - Zsh Plugin Manager
#

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "sindresorhus/pure", use:"{async,pure}.zsh", as:theme
zplug "danielbayerlein/zsh-plugins"

if ! zplug check --verbose; then
  zplug install
fi

zplug load
