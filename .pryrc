Pry.config.editor = "subl -w"

# https://github.com/kyrylo/pry-theme
# $ gem install pry-theme
# $ pry
# $ pry-theme install tomorrow-night
Pry.config.theme = "tomorrow-night"

# Custom prompt
prompt = "ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} * " }
]

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
  Pry.config.print = proc { |output, value| output.puts value.ai(:indent => 2) }
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
if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  case Rails.version.to_i
  when 2
    require 'console_app'
    require 'console_with_helpers'
  when 3
    require 'rails/console/app'
    require 'rails/console/helpers'
    extend Rails::ConsoleMethods if Rails.version.to_f >= 3.2
  else
    warn "[WARN] cannot load Rails console commands"
  end
end

Pry.config.commands.import(default_command_set)
