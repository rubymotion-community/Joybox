unless defined?(Motion::Project::Config)
  raise "The joybox gem must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  
  app.vendor_project('vendor/box2d', 
                     :xcode, :xcodeproj => 'Box2D.xcodeproj', 
                     :target => 'Box2D', 
                     :products => ["libBox2D.a"],
                     :headers_dir => "Box2D")

  app.files += Dir.glob(File.join(app.project_dir, 'box2d/**/*rb'))
end