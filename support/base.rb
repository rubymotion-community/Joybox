module Joybox
  module Support

    class Base < Thor::Group

      include Thor::Actions

      class << self

        attr_accessor :file_path

      end

      # When the class is being inherithed get
      # its file path.
      def self.inherited(klass)

        klass.file_path = caller.first[/^[^:]+/]
      end


      def self.desc(description=nil)

        return super if description

        ERB.new(File.read(usage_path)).result(binding)
      end


      def self.usage_path

        File.expand_path(File.join(File.dirname(file_path), Constants::USAGE_FILE))
      end


      def self.source_root

        File.dirname(__FILE__)
      end


      def self.source_paths_for_search

        source_paths = Array.new

        source_paths << self.source_root
        source_paths << File.join(self.source_root, File.join('..', Constants::RESOURCES_FOLDER))
        source_paths << File.join(self.source_root, Constants::TEMPLATES_FOLDER)
        
        source_paths
      end

    end

  end
end