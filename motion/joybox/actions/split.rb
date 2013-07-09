module Joybox
  module Actions

    class Split

      def self.defaults
        {
          duration: 0.3
        }
      end

      def self.with(options = {})
        # Todo print error message on the console
        return unless [:columns, :rows].any? { |k| options.has_key? k }

        options = options.nil? ? defaults : defaults.merge!(options)
        return CCSplitCols.actionWithCols(options[:columns], duration: options[:duration]) if options.has_key? :columns
        return CCSplitRows.actionWithRows(options[:rows], duration: options[:duration]) if options.has_key? :rows
      end

    end

  end
end