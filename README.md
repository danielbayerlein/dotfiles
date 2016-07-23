# My configuration files

## Installation

1. To get started, install [homesick](https://github.com/technicalpickles/homesick) first:

  ```bash
  $ gem install homesick
  ```

2. Use the `homesick` command to clone my castle:

  ```bash
  $ homesick clone danielbayerlein/dotfiles
  ```

3. Put your Git credentials into `~/.gitconfig.local`. For example:

  ```
  [user]
     name = Foo Example
     email = foo@example.com
  ```

4. Symlinks all dotfiles:

  ```bash
  $ homesick link dotfiles
  ```

5. Install dependencies and plugins:

  ```bash
  $ homesick rc --force dotfiles
  ```

## Usage

```bash
$ homesick
```

## Configuration files for

* [Atom](https://atom.io/) is a hackable text editor for the 21st Century

* [Git](http://git-scm.com) is a distributed version control system
 * [.gitconfig](home/.gitconfig)

* [HyperTerm](https://hyperterm.org) is a JS/HTML/CSS Terminal
 * [.hyperterm.js](home/.hyperterm.js)

* [Prezto](https://github.com/sorin-ionescu/prezto) is the configuration framework for [Zsh](http://www.zsh.org)
 * [.zshrc](home/.zshrc)
 * [.zpreztorc](home/.zpreztorc)

* [RubyGems](https://rubygems.org) is the Ruby community's gem hosting service
 * [.gemrc](home/.gemrc)

* [tmux](http://tmux.sourceforge.net) is a terminal multiplexer
 * [.tmux.conf](home/.tmux.conf)

* [Vim](http://www.vim.org) is a highly configurable text editor
 * [.vimrc](home/.vimrc)
