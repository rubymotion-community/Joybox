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
  = Joybox 1.1.0 =

  Contributors
  * Kenichi Yonekawa, yonekawa
  * Earl St Sauver, estsauver
  * Denis Laprise, nside
  * Franklin Webber, burtlo
  * Andrew Currie, AndrewCurrie
  * Jamon Holmgren, jamonholmgren
  * Christopher David Yudichak, TheOddLinguist
  * Donald Hutchison, rkachowski
  * Didier Prophete, dprophete 
  * Severin Schoepke, severin
  * awdogsgo2heaven
  * Juha Litola, jlitola
  * David Padilla, dabit 
  * PanPan, ippan
  * Keyvan Fatehi, keyvanfatehi
  * n-studio

  Physics
  * Support for all Shapes and Listeners.

  * Filters, AABB computations, Queries and Ray Casts.

  * Collision support for Physics Sprites.

  * Experimental support for actions on Physics Sprites.

  * Physics Debug Draw.

  Effects and Background Music
  * AudioEffect and BackgroundAudio to playback background music and special effects.

  Tile Maps Support
  * Support for TMX Maps using the TileMap class.

  Actions
  * Complete actions

  Gestures
  * Support the default gestures on OSX.

  Commands
  * Adds joybox:retina command to create a Retina version of a TMX Map. 

  Sprites
  * Support for custom options on the Sprite initialization.

  Source Code
  * The commands and templates now install automatically.

  * Added 218 specifications and 617 requirements.

  Critical Changes
  * Node: The method add_childs is now add_children.

  * SpriteFrameCache: The method where now starts from 1 instead of 0.

  * Animation: The delay method is now delay_units, and total_delay is now delay_per_unit.

  * Menu: The method align_items_in_columns now receive an array for defining how many columns and 
          how many items in which of them.

  * Physics: Now every object returns their values in pixel coordinates and degrees, if you still 
             need to use the metric values you can access them with the prefix metric_. 
             For example: metric_position.

  * World: The Method continuos_physics is now deprecated.

  * Physics Collisions: Now for use when_collide method of the World instance, you need to pass an 
                        instance of a PhysicsSprite and it will return in the block the colliding 
                        physics sprite if available, or the body that is colliding.

  * Point: The methods to and from pixel coordinates are now inverted, there was an incorrect naming.

  00000000000000111111111111110000000000000000000000000000000000
  00000000000000000111111111111111111111100000000000000000000000
  00000000000000000011111111111111111111111111111110000000000000
  00000000000000111111111111111111111111111111111111111000000000
  00000000000001111111111111111111111111111111111111111111000000
  00000001100001111111111110000000111111111111111111111111000000
  00000011111001111111111100000000011111111111111111111110000000
  00000011111111111111111000000000001111111111111111111000000000
  00000011111111111111111000000000011111111111111111100000000000
  00000001111111111111111110000000111111111111111110000000000000
  00000001111110011111111111111111111111111111100000000000000000
  00000001111100011111111111111111111111111000000000000000000000
  00000000011000001111111111111111111110000000000000000000000000
  00000000000000000111111111111111110000000000000000000000000000
  00000000000000000000000111111111000000000000000000000000000000
  00000000000000000000011111111000000000000000000000000000000000
  00000000000000000001111100000000000000000000000000000000000000

  MESSAGE
end