Pry.config.editor = "subl -w"
Pry.config.editor = proc { |file, line| "#{Pry.config.editor} #{file}:#{line}" }

# https://github.com/kyrylo/pry-theme
# $ gem install pry-theme
Pry.config.theme = "solarized"

# Custom prompt
prompt = "ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
prompt << "@#{Rails.version}" if defined?(Rails)
Pry.config.prompt = [
  proc { |obj, nest_level| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level| "#{prompt} (#{obj}):#{nest_level} * " }
]

Pry.config.hooks.add_hook :after_session, :say_bye do
  puts "bye-bye" if Pry.active_sessions == 1
end

# Default Command Set, add custom methods here:
default_command_set = Pry::CommandSet.new do
  command "pccopy", "Copy argument to the clip-board" do |str|
     IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end
end

# https://github.com/michaeldv/awesome_print/
# $ gem install awesome_print
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai(indent: 2) }
rescue LoadError => e
  warn "[WARN] #{e}"
  puts "$ gem install awesome_print"
end

# Use Array.toy to get an array to play with
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i+1 }
  end
end

# Use Hash.toy to get an hash to play with
class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96+(c+1)).chr })]
  end
end

# Launch Pry with access to the entire Rails stack.
rails = File.join(Dir.getwd, 'config', 'environment.rb')
if defined?(Rails) && File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  case Rails.version[0..0].to_f
  when 2
    require 'console_app'
    require 'console_with_helpers'
  when 3
    require 'console_app'
    require 'console_with_helpers'
    include Rails::ConsoleMethods if Rails.version[0..2].to_f >= 3.2
  else
    warn "[WARN] cannot load Rails console commands"
  end
end

Pry.config.commands.import default_command_set
