begin
  require 'thin'
rescue LoadError => ex
  $stderr.puts "Oops.. can't load Thin, try: gem install thin"
  exit!
end

module Webify
  module Backend
    
    class Thin
      def self.start!(options={})
        dir  = File.expand_path(options[:dir] || Webify::DEFAULT_DIR)
        port = options[:port] || Webify::DEFAULT_PORT
        
        server = ::Thin::Server.new('0.0.0.0', port) do
          use Rack::CommonLogger
          run Rack::Directory.new(dir)
        end
        
        trap('INT') { server.stop! }
        
        Dir.chdir(dir)
        server.start!
      end
    end
    
  end
end
