# -*- encoding: utf-8 -*-
require File.expand_path('../lib/joybox/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'joybox'
  gem.version = Joybox::VERSION
  gem.authors = ['Juan José Karam', 'Gabriel Sosa', 'Contributors']
  gem.email = 'juanjokaram@gmail.com'
  
  gem.description = 'A Cocos2D & Box2D Wrapper for creating video games using RubyMotion'
  gem.summary = 'A Cocos2D & Box2D Wrapper for RubyMotion'

  gem.homepage = 'http://joybox.io'
  gem.license = 'MIT'

  gem.files = `git ls-files`.split($\)
  gem.require_paths = ['lib', 'motion', 'vendor', 'command', 'template']
  gem.test_files = gem.files.grep(%r{^spec/})

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.extensions = ['ext/extconf.rb'] 

  gem.post_install_message = <<-MESSAGE
  ** Joybox 1.1.0 **
  MESSAGE
end