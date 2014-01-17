require 'rubygems'
require 'peridot'

# Configuration
ignored_files << 'README.md'

# $ rake dotfiles
namespace :dotfiles do
  # $ rake dotfiles:dot
  desc 'Link dotfiles'
  task :dot do
    dotfiles.map { |f| link_file(repo_file(f), home_file(f)) }
  end

  # $ rake dotfiles:sublime
  desc 'Link Sublime configuration files'
  task :sublime do
    sublime_configuration_files.map do |f|
      link_file(repo_file(f), sublime_configuration_file(f))
    end
  end

  # $ rake dotfiles:git
  desc 'Generate .gitconfig'
  task :git do
    generate_file(repo_file('.gitconfig.erb'), home_file('.gitconfig'))
  end

  task :vim_vundle => :dot do
    unless Dir.exists?(vundle_dir = "#{Dir.home}/.vim/bundle/vundle")
      system("git clone https://github.com/gmarik/vundle.git #{vundle_dir}")
    end
    system('vim +BundleClean! +BundleInstall +qall')
  end
end

def sublime_configuration_file(file)
  "#{Dir.home}/Library/Application Support/Sublime Text 3/Packages/User/#{file}"
end

def sublime_configuration_files
  Dir['*'].reject { |file| ignored?(file) }
end

def dotfiles
  Dir['.*'].reject { |file| File.directory?(file) or ignored?(file) }
end
