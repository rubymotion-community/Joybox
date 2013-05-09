# -*- encoding: utf-8 -*-
require File.expand_path('../lib/joybox/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'joybox'
  gem.version       = Joybox::VERSION

  gem.authors  = ['Juan José Karam']
  gem.email = 'juanjokaram@gmail.com'
  
  gem.description = <<-DESC
    A Cocos2D & Box2D DSL for RubyMotion
  DESC

  gem.summary = 'A Cocos2D & Box2D DSL for RubyMotion'
  gem.homepage = 'http://joybox.io'
  gem.license = 'MIT'

  gem.files       = `git ls-files`.split($\)
  gem.require_paths = ['lib']
  gem.test_files  = gem.files.grep(%r{^spec/})

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.executables   = ["joybox"]

  gem.post_install_message = <<-MESSAGE
  ** Joybox 0.0.6 **

  * Added OSX development support. Use 'motion create --template=joybox-osx' to create
    an OSX project.
  * Added Ruby Motion Template support. Use 'joybox install' to install the templates (joybox-ios & joybox-osx)
  * Added Ruby Motion Command support. Use 'motion joybox:generate <class> <name>' to generate Sprites, Layers and Scene subclases and their respective specs.
  * Added Circle Shape to Box2D Fixtures. Thank you Kenichi Yonekawa!
  * Added Sprite Batch & Sprite Frame Cache full support.
  * Added Animations and Animate Action.
  * Added Bezier, Blink, Fade, Jump, Place, Spawn, Tint action. Thanks Gabriel Sosa!
  * Added Repeat.with actions:<array of actions> times:<number of times> method to Repeat class.
  * IMPORTANT: Changed Sequence.new items:<array of actions> for Sequence.with actions:<array of actions> in Sequence class.
  * IMPORTANT: Typo fix in the Body class, changing edge_fixure and polygon_fixure to edge_fixture and polygon_fixture.
  * Better bridgesupport generation :D, thank you Laurent Sansonetti!
  * Added: mouse and keyboard events to joybox-osx. 
  * Joybox is stopping the madness! Thanks all for your support!

                    _+880_____________________________
                    _++88_____________________________
                    _++88_____________________________
                    __+880_________________________++
                    __+888________________________+88_
                    __++880______________________+88__
                    __++888_____+++88__________+++8___
                    __++8888__+++8880++88____+++88____
                    __+++8888+++8880++8888__++888_____
                    ___++888++8888+++888888++888______
                    ___++88++8888++8888888++888_______
                    ___++++++888888888888888888_______
                    ____++++++88888888888888888_______
                    ____++++++++000888888888888_______
                    _____+++++++000088888888888_______
                    ______+++++++00088888888888_______
                    _______+++++++088888888888________
                    _______+++++++088888888888________
                    ________+++++++8888888888_________
                    ________+++++++0088888888_________
                    ________++++++0088888888__________
  MESSAGE

end
