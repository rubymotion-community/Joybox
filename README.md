# Joybox

Introduced at [#Inspect 2013](http://www.rubymotion.com/conference/),
Joybox is the easiest way to build 2D games for iPhones and iPads
using [RubyMotion](http://www.rubymotion.com/). Joybox combines the
most popular and widely used 2D game engine for iOS,
[Cocoa2D](http://www.cocos2d-iphone.org/), folds in the amazing
[Box2D](http://box2d.org/) physics engine, and then wraps them up into
a clean Ruby API that will make game development faster and more
enjoyable for both beginners and experts alike.

For more information, see the presentation: [Cocos2D, an Easier
Way](https://speakerdeck.com/curveberyl/cocos2d-an-easier-way).

## Feedback and Help

For questions, feedback, bug reports, use the project's [Issue
Tracker](https://github.com/rubymotion/Joybox/issues).

## Getting Started

### Installation with RubyGems

First install Joybox from RubyGems. Run:

    gem install joybox

Next, add to your Rakefile:

    require 'joybox'

### Installation with Bundler

First, add to your Gemfile:

    gem 'joybox'

Next, install the Joybox gem by running:

    bundle

## Core Classes

For building games, the core classes are Director, Scene, Layer, and Sprite.

For more info, see: [cocos2d Basic Concepts](http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:basic_concepts)

### Director

The director presents scenes, manages flow from one scene to another,
manages the game loop, and responds to interruptions.

### Scene

A scene is composed of multiple layers. Examples of scenes are: menus,
game levels, cut scenes, and high score screen.

### Layer

Layers are primarily where a game's sprites are placed. Layers handle
user interaction, for example screen touches or device orientation.

### Sprite

Sprites are 2D images that have independent movement, such as
rotation, scaling, translation and animation.

## Contributions

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Joybox is released under the MIT License.

## Authors

[Juan Karam](https://github.com/CurveBeryl) [@JuanKaram](https://twitter.com/JuanKaram)
