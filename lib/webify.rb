require 'webrick'
require 'optparse'

require 'ruby-debug'

class Webify
  include WEBrick
  
  DEFAULT_PORT = 3000

  def self.start(options={})
    dir  = File.expand_path(options[:dir] || Dir::pwd)
    port = options[:port] || DEFAULT_PORT
    
    msg = "Serving:  #{dir}\nURL:      http://#{Socket.gethostname}:#{port}"

    puts "="*80
    puts "#{msg}\n"
    puts ("="*80)+"\n\n"
    
    server = HTTPServer.new(
      :Port            => port,
      :DocumentRoot    => dir
    )
    
    trap('INT') { server.shutdown }
    server.start
  end
end

options = {
  :port => Webify::DEFAULT_PORT,
  :dir  => Dir.pwd
}

options_parser = OptionParser.new do |opts|
  opts.banner = "Webify -- serve any directory to your browser\n"+
                "Usage: webify [options]"

  opts.separator ""
  opts.separator "Server options:"

  opts.on('-p', '--port PORT', "Use PORT (default: #{options[:port]})") {|val| options[:port] = val }
  opts.on('-d', '--dir DIRECTORY', "Document root DIRECTORY (default: #{options[:dir]})") {|val| options[:dir] = val }
  opts.on('-h', '--help', 'Display this help message') { puts opts; exit! }
end
options_parser.parse!(ARGV)

Webify.start(options)
