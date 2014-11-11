lib_dir = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
require "pry"
binding.pry
__END__



require 'cli'

CLI.new($stdin, $stdout).call
