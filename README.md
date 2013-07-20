# Joybox [![Build Status](https://travis-ci.org/rubymotion/Joybox.png?branch=master)](https://travis-ci.org/rubymotion/Joybox)
Introduced at [#Inspect 2013](http://www.rubymotion.com/conference/), Joybox is the easiest way to build 2D games for iPhones and iPads using [RubyMotion](http://www.rubymotion.com/). Joybox combines the most popular and widely used 2D game engine for iOS, [Cocos2D](http://www.cocos2d-iphone.org/), folds in the amazing [Box2D](http://box2d.org/) physics engine, and then wraps them up into a clean Ruby API that will make game development faster and more enjoyable for both beginners and experts alike.

For more information, see the presentation: [Cocos2D, an Easier Way](https://speakerdeck.com/curveberyl/cocos2d-an-easier-way).

## Warning for the Repository Version

### Critical change on Physics Collisions

Now for use when_collide method of the World instance, you need to pass an instance of a PhysicsSprite and it will return in the block the colliding physics sprite if available, or the body that is colliding. Example:

```ruby
@world.when_colide physics_sprite do |collision_sprite, is_touching|
end
```

If you still need to get the collisions of the physics bodies you can use the following:

```ruby
@world.on_collision do |first_body, second_body, is_touching|
end
```

## Latest version (1.0.0)
* Added REPL Support for iOS and OSX :D
* NOTE: If the iOS simulator starts on landscape orientation, please rotate and return it. (cmd + => and cmd + <=)
* Added REPL Example Template. Use 'motion create --template=joybox-ios-example-repl <name>' or 'motion create --template=joybox-osx-example-repl <name>'
* IMPORTANT: Typo fix in World class (Joybox, Box2D and Website), changing to continuous_physics the configuration, thank you David Czarnecki!
* IMPORTANT: Typo fix in Macros, changing jbpLenght to jpbLength, thank you David Czarnecki!
* Added: Clear extra lines in iOS Template. Thank you Willrax!
* Added: Examples iPhone 5 support
* Added: iOS Template iPhone 5 support
* Joybox is stopping the madness! Thanks all for your support!

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