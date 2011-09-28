# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'webify'
  s.version     = '0.1.1'
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Serve any directory to your browser'
  s.description = s.summary

  s.authors     = ['Rida Al Barazi', 'Peter Kieltyka']
  s.email       = ['rida@nulayer.com', 'peter@nulayer.com']
  s.homepage    = 'http://github.com/nulayer/webify'
  
  s.required_rubygems_version = ">= 1.3.6"
  
  s.files        = Dir['README.md', 'lib/**/*']  
  s.executables  = Dir['bin/*'].map {|f| File.basename(f) }
  s.require_path = 'lib'
end
