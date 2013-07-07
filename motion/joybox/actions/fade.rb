module Joybox
  module Actions

    class Fade

      def self.defaults
        {
          duration: 0.3,
          opacity: 0
        }
      end

      def self.in(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCFadeIn.actionWithDuration(options[:duration])
      end

      def self.out(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        return fade_out(options) unless options[:tiled]
        return fade_out_tiled(options) if options[:tiled]
      end

      def self.to(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)
        CCFadeTo.actionWithDuration(options[:duration],
                                    opacity: options[:opacity])
      end


      private

        def self.fade_out(options = {})
          CCFadeOut.actionWithDuration(options[:duration])
        end

        def self.fade_out_tiled(options = {})
          # Todo print error message on the console
          return unless options.has_key? :grid_size

          klass = case options[:from]
          when :top_right
            CCFadeOutBLTiles
          when :bottom_left
            CCFadeOutTRTiles
          when :bottom
            CCFadeOutUpTiles
          when :top
            CCFadeOutDownTiles
          else
            CCFadeOutBLTiles
          end

          klass.actionWithSize(options[:grid_size], duration: options[:duration])
        end

    end

  end
end