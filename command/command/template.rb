require File.expand_path('../string.rb', __FILE__)

module Joybox
  module Command
    class Template

      attr_reader :name

      def initialize(name, klass)
        @name = name.titleize
        @klass = klass.downcase

        templates_directory = File.expand_path("../../templates/", __FILE__)
        @template_class_file = File.expand_path("#{klass}.erb", templates_directory)
        @template_spec_file = File.expand_path("#{klass}_spec.erb", templates_directory)
      end

      def save
        begin
          app_directory = find_directory('app')
          spec_directory = find_directory('spec')
        rescue
          Motion::Project::App.log 'Error', 'The command needs to be run inside of a RubyMotion project'
          return
        end

        class_file = File.join(app_directory, "#{@klass}s/#{name.underscore}_#{@klass}.rb")
        test_file = File.join(spec_directory, "#{@klass}s/#{name.underscore}_#{@klass}_spec.rb")

        create_file(class_file, @template_class_file)
        create_file(test_file, @template_spec_file)
      end

      private

        def find_directory(directory)
          finded_directories = Dir.glob(directory)

          if finded_directories.size != 1
            find_app_directory(File.join('..', directory))
          else
            finded_directories[0]
          end
        end

        def create_file(file_path, template_path)
          return Motion::Project::App.log 'Warning', "#{file_path} exists" if File.exists?(file_path)

          FileUtils.mkdir_p(File.dirname(file_path))
          File.open(file_path, "w") do |file|
            file << ERB.new(File.read(template_path)).result(binding)
          end

          Motion::Project::App.log 'Create', "#{file_path}"
        end

    end
  end
end
