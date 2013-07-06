class String

  def underscore
    gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def titleize
    gsub(/([A-Z])/, '_\1').split(/_/).map(&:capitalize).join
  end

end

module Motion; module Project
  class JoyboxGenerateCommand < Command

    self.name = 'joybox:generate'
    self.help = 'Joybox: Class Generator'

    attr_reader :name

    def run(args)

      if args.empty? or args.size != 2 
        show_help
      end

      klass = args[0]
      name = args[1]

      template_class_file = File.expand_path("../joybox/templates/#{klass}.erb", __FILE__)
      template_spec_file = File.expand_path("../joybox/templates/#{klass}_spec.erb", __FILE__)

      unless File.exists?(template_class_file)
        show_help
      end

      begin
        app_directory = find_app_directory
        spec_directory = find_spec_directory
      rescue
        die 'The command needs to run inside of a RubyMotion project'
      end

      class_file = File.join(app_directory, "#{klass}s/#{name.underscore}_#{klass}.rb")
      test_file = File.join(spec_directory, "#{klass}s/#{name.underscore}_#{klass}_spec.rb")

      if File.exists?(class_file) or File.exists?(test_file)
        App.log 'Duplicate', "#{class_file} exists" if File.exists?(class_file)
        App.log 'Duplicate', "#{test_file} exists" if File.exists?(test_file)
        exit 1
      end

      create_directory(File.dirname(class_file))
      create_directory(File.dirname(test_file))

      @name = name.titleize
      create_file(class_file, template_class_file)
      create_file(test_file, template_spec_file)
    end


    def find_app_directory(directory = 'app')
      finded_directories = Dir.glob(directory)

      if finded_directories.size != 1
        find_app_directory(File.join('..', directory))
      else
        finded_directories[0]
      end 
    end


    def find_spec_directory(directory = 'spec')
      finded_directories = Dir.glob(directory)

      if finded_directories.size != 1
        find_app_directory(File.join('..', directory))
      else
        finded_directories[0]
      end 
    end


    def create_directory(directory)
      FileUtils.mkdir_p(directory) unless File.directory?(directory)
    end


    def create_file(file_path, template_path)
      File.open(file_path, "w") { |io|
        io.print ERB.new(File.read(template_path)).result(binding)
      }
      App.log 'Create', "#{file_path}"
    end


    def show_help
      usage_file = File.expand_path("../joybox/USAGE", __FILE__)
      die File.read(usage_file)
    end

  end
end; end