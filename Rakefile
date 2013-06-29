$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx' if ENV['osx']
require 'motion/project/template/ios' unless ENV['osx']
require 'bundler'
Bundler.require

# Borrowed from BubbleWrap: https://github.com/rubymotion/BubbleWrap
# Thanks BubbleWrap Team! http://bubblewrap.io
module Motion; module Project
  class Config
    def spec_files=(spec_files)
      @spec_files = spec_files
    end
  end
end; end

Motion::Project::App.setup do |app|
  app.name = 'Joybox'
  app.identifier = 'com.rubymotion.joybox'
  app.version = "1.0.0"

  if app.template != :ios
    app.spec_files -= Dir.glob("./spec/motion/joybox-ios/**/*.rb")
    app.files -= Dir.glob("./app/ios/**/*.rb")
  else
    app.interface_orientations = [:landscape_left, :landscape_right]
    app.spec_files -= Dir.glob("./spec/motion/joybox-osx/**/*.rb")
    app.files -= Dir.glob("./app/osx/**/*.rb")
  end
end