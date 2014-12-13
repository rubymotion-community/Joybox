# Joybox [![Build Status](https://travis-ci.org/rubymotion/Joybox.png?branch=master)](https://travis-ci.org/rubymotion/Joybox)

Currently this project is unmaintained, if you are interested in picking it up please open an issue and let us know!  In the meantime take a look at SpriteKit and SceneKit for iOS and OS X.

Introduced at [#Inspect 2013](http://www.rubymotion.com/conference/), Joybox is the easiest way to build 2D games for iPhones and iPads using [RubyMotion](http://www.rubymotion.com/). Joybox combines the most popular and widely used 2D game engine for iOS, [Cocos2D](http://www.cocos2d-iphone.org/), folds in the amazing [Box2D](http://box2d.org/) physics engine, and then wraps them up into a clean Ruby API that will make game development faster and more enjoyable for both beginners and experts alike.

For more information, see the presentation: [Cocos2D, an Easier Way](https://speakerdeck.com/curveberyl/cocos2d-an-easier-way).

## Latest version (1.1.0)
**Physics**

* Support for all Shapes and Listeners.
* Filters, AABB computations, Queries and Ray Casts.
* Collision support for Physics Sprites.
* Experimental support for actions on Physics Sprites.
* Physics Debug Draw.

**Effects and Background Music**

* AudioEffect and BackgroundAudio to playback background music and special effects.

**Tile Maps Support**

* Support for TMX Maps using the TileMap class.

**Actions**

* Complete actions

**Gestures**

* Support the default gestures on OSX.

**Commands**

* Adds joybox:retina command to create a Retina version of a TMX Map. 

**Sprites**

* Support for custom options on the Sprite initialization.

**Source Code**

* The commands and templates now install automatically.
* Added 218 specifications and 617 requirements.

**Critical Changes**

* Node: The method add_childs is now add_children.

* SpriteFrameCache: The method where now starts from 1 instead of 0.

* Animation: The delay method is now delay_units, and total_delay is now delay_per_unit.

* Menu: The method align_items_in_columns now receive an array for defining how many columns and how many items in which of them.

* Physics: Now every object returns their values in pixel coordinates and degrees, if you still need to use the metric values you can access them with the prefix metric_. For example: metric_position.

* World: The Method continuos_physics is now deprecated.

* Physics Collisions: Now for use when_collide method of the World instance, you need to pass an instance of a PhysicsSprite and it will return in the block the colliding physics sprite if available, or the body that is colliding.

* Point: The methods to and from pixel coordinates are now inverted, there was an incorrect naming.

## Documentation and Getting Started
If you are looking for the installation process and the documentation, please visit: [joybox.io](http://joybox.io)

Also you can look at some examples in this repository: [Joybox - Examples](https://github.com/CurveBeryl/Joybox-Examples)

## Troubleshoot Installation
If you run into troubles running your Joybox game, please do the following, in the root folder of your project:
```
gem uninstall joybox -a

gem install joybox

rm .repl_history

rake clean

rake
```

## Troubleshoot the REPL
If the iOS application starts in landscape orientation, please rotate and return it to the original orientation. 

(cmd + <= & cmd + =>) 

## Feedback and Help
For questions and feedback use the project's [Google Group](https://groups.google.com/forum/?fromgroups#!forum/joybox-wrapper)

For bug reports use the project's [Issue Tracker](https://github.com/rubymotion/Joybox/issues).

## Contributions
If you wish to help us to stop the madness, there are some ways you can do it:

* Joybox Wrapper (Ruby): This repository ;)
* Box2D Wrapper (C++): [Joybox - Box2D](https://github.com/CurveBeryl/Joybox-Box2D)
* Documentation (markdown): [Joybox - Documentation](https://github.com/CurveBeryl/Joybox-Documentation) 

To contribute just:

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License
Joybox is released under the MIT License.

## Authors
**Cocos2D**: Ricardo Quesada, Zynga and contributors [cocos2d for iPhone](http://www.cocos2d-iphone.org)

**Box2D**: Erin Catto [Box2D | A 2D Physics Engine for Games](http://box2d.org)

**Joybox**: [Juan José Karam](https://github.com/CurveBeryl) [@JuanKaram](https://twitter.com/JuanKaram) and [Gabriel Sosa](https://github.com/mexinsane) [@mexinsane](https://twitter.com/mexinsane) and contributors
