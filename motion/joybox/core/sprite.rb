module Joybox
  module Core

    class Sprite < CCSprite

      extend Joybox::Common::Initialize

      alias_method :run_action, :runAction
      alias_method :stop_action, :stopAction
      alias_method :stop_all_actions, :stopAllActions
      alias_method :bounding_box, :boundingBox

      
      def initialize(options = {})
        initialize_with_file_name(options) if options.has_key? (:file_name)
        initialize_with_texture(options) if options.has_key? (:texture)
        initialize_with_frame_name(options) if options.has_key? (:frame_name)
        initialize_with_frame(options) if options.has_key? (:frame)
        initialize_with_cg_image(options) if options.has_key?(:cg_image) && options.has_key?(:key)
        self.position = options[:position] if options.has_key? (:position)
      end
      
      def file_name=(file_name)
        texture = CCTextureCache.sharedTextureCache.addImage(file_name)
        self.setTexture(texture)
      end
      
      # Review this in another version, because I dont still quite convinced
      # that this is the correct approach. The alternative is two methods
      # flip_x and flip_y, but I dont like them either.
      def flip(options = {})
        self.flipX = options[:x] if options.include?(:x)
        self.flipY = options[:y] if options.include?(:y)
      end

      def setPosition(position)
        super
      end

      def setContentSize(size)
        super
      end

      def nodeToParentTransform
        super
      end

      def boundingBox
        super
      end


      private 

      def initialize_with_file_name(options = {})
        initWithFile(options[:file_name]) if options[:rect].nil?
        initWithFile(options[:file_name], rect: options[:rect]) unless options[:rect].nil?
      end

      def initialize_with_texture(options = {})
        initWithTexture(options[:texture]) if options[:rect].nil?
        initWithTexture(options[:texture], rect: options[:rect]) unless options[:rect].nil? 
      end

      def initialize_with_frame_name(options = {})
        initWithSpriteFrameName(options[:frame_name])
      end

      def initialize_with_frame(options = {})
        initWithSpriteFrame(options[:frame])
      end

      def initialize_with_cg_image(options = {})
        initWithCGImage(options[:cg_image].CGImage, key:options[:key])
      end

    end

  end
end
