# Joybox
Introduced at [#Inspect 2013](http://www.rubymotion.com/conference/), Joybox is the easiest way to build 2D games for iPhones and iPads using [RubyMotion](http://www.rubymotion.com/). Joybox combines the most popular and widely used 2D game engine for iOS, [Cocos2D](http://www.cocos2d-iphone.org/), folds in the amazing [Box2D](http://box2d.org/) physics engine, and then wraps them up into a clean Ruby API that will make game development faster and more enjoyable for both beginners and experts alike.

For more information, see the presentation: [Cocos2D, an Easier Way](https://speakerdeck.com/curveberyl/cocos2d-an-easier-way).

## Latest version (0.0.6)
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
* Added: Bug fixes in the Website! Thanks Francisco Granados! 
* Joybox is stopping the madness! **Thanks all** for your support!

## Documentation and Getting Started
If you are looking for the installation process and the documentation, please visit: [joybox.io](http://joybox.io)

Also you can look at some examples in this repository: [Joybox - Examples](https://github.com/CurveBeryl/Joybox-Examples)

## Feedback and Help
For questions, feedback, bug reports, use the project's [Issue Tracker](https://github.com/rubymotion/Joybox/issues).

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