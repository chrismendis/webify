require 'webrick'

module Webify
  module Backend
    
    class Webrick
      include ::WEBrick

      def self.start!(options={})
        dir  = File.expand_path(options[:dir] || Webify::DEFAULT_DIR)
        port = options[:port] || Webify::DEFAULT_PORT

        server = HTTPServer.new(
          :Port            => port,
          :DocumentRoot    => dir
        )

        trap('INT') { server.shutdown }
        server.start
      end
    end
    
  end
end
