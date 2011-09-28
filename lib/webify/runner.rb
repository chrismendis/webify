require 'optparse'

module Webify
  class Runner
    
    def self.start!
      options = {
        :backend  => Webify::DEFAULT_BACKEND,
        :port     => Webify::DEFAULT_PORT,
        :dir      => Webify::DEFAULT_DIR,
        :throttle => 0
      }

      options_parser = OptionParser.new do |opts|
        opts.banner = "Webify -- serve any directory to your browser\n"+
                      "Usage: webify [options]"

        opts.separator ""
        opts.separator "Server options:"

        opts.on('-m', '--mongrel', "Use Mongrel as the backend (default: #{options[:backend]})") {|val| options[:backend] = 'Mongrel' }
        opts.on('-d', '--dir DIRECTORY', "Document root DIRECTORY (default: #{options[:dir]})") {|val| options[:dir] = val }
        opts.on('-p', '--port PORT', "Use PORT (default: #{options[:port]})") {|val| options[:port] = val }
        opts.on('-h', '--help', 'Display this help message') { puts opts; exit! }
        
        opts.separator ""
        opts.separator "Mongrel backend options:"
        opts.on('-t', '--throttle', "Time to pause (in hundredths of a second) between accepting clients. (default: #{options[:throttle]})") {|val| options[:throttle] = val }
      end
      options_parser.parse!(ARGV)
            
      # Load the backend
      begin
        require "webify/backend/#{options[:backend].downcase}"
      rescue LoadError => ex
        $stderr.puts "Error! Cannot load backend #{options[:backend]}"
        exit
      end
      
      backend_klass = instance_eval("Webify::Backend::" + options[:backend])
      
      # Booting up the server
      msg = "Serving:  #{options[:dir]}\nURL:      http://#{Socket.gethostname}:#{options[:port]}"
      puts "="*80
      puts "#{msg}\n"
      puts ("="*80)+"\n\n"
      
      backend_klass.start!(options)
    end
    
  end
end
