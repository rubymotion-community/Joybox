$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'Joybox'
  app.identifier = 'com.rubymotion.joybox'
  app.version = "1.0.0"
  app.interface_orientations = [:landscape_left, :landscape_right]
end