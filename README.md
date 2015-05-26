# My configuration files

## Installation

1. To get started, install [homesick](https://github.com/technicalpickles/homesick) first:

   ```bash
   $ gem install homesick
   ```

2. Use the homesick command to clone my castle:

   ```bash
   $ homesick clone danielbayerlein/dotfiles
   ```

3. Set your Git email address as a global environment variable:

   ```bash
   $ sudo su
   $ touch /etc/launchd.conf
   $ echo setenv GIT_EMAIL foo@example.com >> /etc/launchd.conf
   ```

4. Symlinks all dotfiles:

  ```bash
  $ homesick link danielbayerlein/dotfiles
  ```

## Usage

```bash
$ homesick
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
