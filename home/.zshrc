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
# zplug - Zsh Plugin Manager
#

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "sindresorhus/pure", use:"{async,pure}.zsh", as:theme
zplug "danielbayerlein/zsh-plugins"

zplug load
