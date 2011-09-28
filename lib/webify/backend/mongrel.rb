begin
  require 'mongrel'
rescue LoadError => ex
  $stderr.puts "Oops.. can't load Mongrel, try: gem install mongrel"
  exit!
end

module Webify
  module Backend
    
    class Mongrel
      def self.start!(options={})
        dir  = File.expand_path(options[:dir] || Webify::DEFAULT_DIR)
        port = options[:port] || Webify::DEFAULT_PORT
        throttle = options[:throttle] || 0
        
        server = ::Mongrel::HttpServer.new("0.0.0.0", port, 950, throttle.to_i, 60)
        server.register("/", ::Mongrel::DirHandler.new(dir))
        
        trap('INT') { server.stop }
        server.run.join
      end
    end
    
  end
end
