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
  ** Joybox 1.0.0 **

    * Added REPL Support for iOS and OSX :D
      * NOTE: If the iOS simulator starts on landscape orientation, please rotate and return it.
              (cmd + => and cmd + <=)
    * Added REPL Example Template. Use 'motion create --template=joybox-ios-example-repl <name>' or
      'motion create --template=joybox-osx-example-repl <name>'
    * IMPORTANT: Typo fix in World class (Joybox, Box2D and Website), changing to continuous_physics the configuration, thank you David Czarnecki!
    * IMPORTANT: Typo fix in Macros, changing jbpLenght to jpbLength, thank you David Czarnecki!
    * Added: Clear extra lines in iOS Template. Thank you Willrax!
    * Added: Examples iPhone 5 support
    * Added: iOS Template iPhone 5 support
    * Joybox is stopping the madness! Thanks all for your support!

                        0
                       101
                      01010
                     1010101
                    010101010
                   10101010101
                  0101010101010
                 101010101010101
                01010101010101010
               1010101010101010101
              010101010101010101010
             1                     1
            010                   010
           10101                 10101
          0101010               0101010
         101010101             101010101
        01010101010           01010101010
       1010101010101         1010101010101
      010101010101010       010101010101010
     10101010101010101     10101010101010101
    0101010101010101010   0101010101010101010
   1010101010101010101011101010101010101010101

  MESSAGE

end
