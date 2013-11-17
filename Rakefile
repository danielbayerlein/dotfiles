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
    Rake::Task['vim:vundle:run'].invoke
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
    set(:git_email, ENV['GIT_EMAIL'])
    generate_file(repo_file('.gitconfig.erb'), home_file('.gitconfig'))
  end
end

# $ rake vim
namespace :vim do
  # $ rake vim:vundle
  namespace :vundle do
    # $ rake vim:vundle:install
    desc 'Install Vundle'
    task :install do
      unless Dir.exists?(vundle_dir = "#{Dir.home}/.vim/bundle/vundle")
        system("git clone https://github.com/gmarik/vundle.git #{vundle_dir}")
      end
    end

    # $ rake vim:vundle:run
    desc 'Run Vundle'
    task :run => :install do
      system('vim +BundleClean! +BundleInstall +qall')
    end
  end
end

def sublime_configuration_file(file)
  "#{Dir.home}/Library/Application Support/Sublime Text 2/Packages/User/#{file}"
end

def sublime_configuration_files
  Dir['*'].reject { |file| ignored?(file) }
end

def dotfiles
  Dir['.*'].reject { |file| File.directory?(file) or ignored?(file) }
end
