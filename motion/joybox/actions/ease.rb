module Joybox
  module Actions

    class Ease

      def self.defaults
        {
          action: nil,
          rate: 0.0,
          period: 0.0
        }
      end

      def self.in(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseIn.actionWithAction(options[:action], 
                                  rate: options[:rate])
      end

      def self.out(options = {})

        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseOut.actionWithAction(options[:action], 
                                  rate: options[:rate])
      end

      def self.in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseInOut.actionWithAction(options[:action], 
                                    rate: options[:rate])
      end

      def self.exponential_in(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseExponentialIn.actionWithAction(options[:action])
      end

      def self.exponential_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseExponentialOut.actionWithAction(options[:action])
      end

      def self.exponential_in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseExponentialInOut.actionWithAction(options[:action])
      end

      def self.sine_in(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseSineIn.actionWithAction(options[:action])
      end

      def self.sine_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseSineOut.actionWithAction(options[:action])
      end

      def self.sine_in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseSineInOut.actionWithAction(options[:action])
      end

      def self.elastic_in(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseElasticIn.actionWithAction(options[:action],
                                         period: options[:period])
      end

      def self.elastic_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseElasticOut.actionWithAction(options[:action],
                                          period: options[:period])
      end

      def self.elastic_in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseElasticInOut.actionWithAction(options[:action],
                                            period: options[:period])
      end

      def self.bounce_in(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBounceIn.actionWithAction(options[:action])
      end      

      def self.bounce_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBounceOut.actionWithAction(options[:action])
      end

      def self.bounce_in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBounceInOut.actionWithAction(options[:action])
      end

      def self.back_in(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBackIn.actionWithAction(options[:action])
      end

      def self.back_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBackOut.actionWithAction(options[:action])
      end

      def self.back_in_out(options = {})
        
        options = options.nil? ? defaults : defaults.merge!(options)

        CCEaseBackInOut.actionWithAction(options[:action])
      end

    end
    
  end
end