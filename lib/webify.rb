require 'webify/version'
require 'webify/runner'

module Webify
  DEFAULT_BACKEND = 'Webrick'
  DEFAULT_PORT    = 3000
  DEFAULT_DIR     = Dir::pwd
end

Webify::Runner.start!
