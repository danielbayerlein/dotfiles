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

3. Set your Git email address as an environment variable. Create an `environment.plist` file in `~/Library/LaunchAgents/` with this content:

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
      <key>Label</key>
      <string>my.startup</string>
      <key>ProgramArguments</key>
      <array>
         <string>sh</string>
         <string>-c</string>
         <string>
         launchctl setenv EMAIL foo@example.com
         </string>
      </array>
      <key>RunAtLoad</key>
      <true/>
   </dict>
   </plist>
   ```

   Replace `foo@example.com` with your Git email address.

   The `plist` will activate after system reboot. You can also use `launchctl load ~/Library/LaunchAgents/environment.plist` to launch it immediately.

   For more information see http://stackoverflow.com/a/26586170 and http://git-scm.com/book/uz/v2/Git-Internals-Environment-Variables.

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
 * [.gitconfig](.gitconfig)

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
