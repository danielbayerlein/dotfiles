# My configuration files

## Installation

1. Install [Peridot](https://github.com/svenwin/peridot) via:

   ```bash
   $ gem install peridot
   ```

2. [Download](../../archive/master.zip) or clone the repository via:

   ```bash
   $ git clone https://github.com/danielbayerlein/dotfiles.git
   ```

3. Set your Git email address as a global environment variable via:

   ```bash
   $ sudo su
   $ touch /etc/launchd.conf
   $ echo setenv GIT_EMAIL foo@example.com >> /etc/launchd.conf
   ```

   Tested on OS X Mountain Lion (10.8)

## Usage

```bash
$ rake -T

rake dotfiles            # Runs all your task in the dotfiles namespace
rake dotfiles:dot        # Link dotfiles
rake dotfiles:git        # Generate .gitconfig
rake dotfiles:sublime    # Link Sublime configuration files
rake watch               # Watches for changes and reruns rake
```

## Configuration files for

* [Git](http://git-scm.com) is a distributed version control system
 * [.gitconfig](.gitconfig.erb)

* [Prezto](https://github.com/sorin-ionescu/prezto) is the configuration framework for [Zsh](http://www.zsh.org)
 * [.zshrc](.zshrc)
 * [.zpreztorc](.zpreztorc)

* [Pry](https://github.com/pry/pry) is a powerful alternative to the standard IRB shell for Ruby
 * [.pryrc](.pryrc)

* [RubyGems](https://rubygems.org) is the Ruby community's gem hosting service
 * [.gemrc](.gemrc)

* [tmux](http://tmux.sourceforge.net) is a terminal multiplexer
 * [.tmux.conf](.tmux.conf)

* [Vim](http://www.vim.org) is a highly configurable text editor
 * [.vimrc](.vimrc)
