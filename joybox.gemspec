# -*- encoding: utf-8 -*-
require File.expand_path('../lib/joybox/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'joybox'
  gem.version       = Joybox::VERSION

  gem.authors  = ['Juan Jose Karam']

  gem.description = <<-DESC


Teacup is a community-driven DSL for making CSS-like styling, and layouts for
complex and simple iOS apps with RubyMotion.

By aiming at making RubyMotion less tedious, Teacup makes RubyMotion feel like
interface builder, and work like a CSS stylesheet.
DESC

  gem.summary = 'A Cocos2D & Box2D DSL for RubyMotion'
  gem.homepage = 'https://github.com/JuanKaram/JoyBox'

  gem.files       = `git ls-files`.split($\)
  gem.require_paths = ['lib']
  gem.test_files  = gem.files.grep(%r{^spec/})

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'

end
