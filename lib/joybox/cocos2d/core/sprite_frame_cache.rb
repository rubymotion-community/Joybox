module Joybox
  module Core

  	class SpriteFrameCache < CCSpriteFrameCache

      # Class Method Alias Method
      class << self

        alias_method :frames, :sharedSpriteFrameCache
        alias_method :purge, :purgeSharedSpriteFrameCache

      end

    end 

  end
end

# Open the CCSpriteFrameCache Class because of the singleton pattern
class CCSpriteFrameCache

  alias_method :remove_all, :removeSpriteFrames
  alias_method :remove_unused_frames, :removeUnusedSpriteFrames     


  def add(options = {})

    add_frame_with_name(options) if options.has_key? (:name)
    add_frames_with_file(options) if options.has_key? (:file_name)

    # Check if it should fail silently or crash if any of the options
    # above are sended
  end


  def add_frame_with_name(options = {})

    if options.has_key? (:frame)

      addSpriteFrame(options[:frame], name: options[:name])
    end

    # Check if it should fail silently or crash if any of the options
    # above are sended
  end


  def add_frames_with_file(options = {})

    if options.has_key? (:texture)

      addSpriteFramesWithFile(options[:file_name], texture: options[:texture])

    elsif options.has_key? (:texture_file_name)

      addSpriteFramesWithFile(options[:file_name], textureFilename: options[:texture_file_name])
    else

      addSpriteFramesWithFile(options[:file_name])
    end

  end


  def remove(options = {})

    remove_frame_by_name(options) if options.has_key? (:name)
    remove_frame_from_file(options) if options.has_key? (:file_name)
    remove_frame_from_texture(options) if options.has_key? (:texture)

    # Check if it should fail silently or crash if any of the options
    # above are sended
  end


  def remove_frame_by_name(options = {})

    removeSpriteFrameByName(options[:name])
  end


  def remove_frame_from_file(options = {})

    removeSpriteFramesFromFile(options[:file_name])
  end


  def remove_frame_from_texture(options = {})

     removeSpriteFramesFromTexture(options[:texture])
  end


  def [](name)

    spriteFrameByName(name)
  end


  def []=(name, frame)

    addSpriteFrame(frame, name: name)
  end 


  def select(&block)
    p valueForKey('spriteFramesAliases_').keys

    valueForKey('spriteFrames_').select(&block)
  end


  def frames_by_prefix(prefix)

  end

end