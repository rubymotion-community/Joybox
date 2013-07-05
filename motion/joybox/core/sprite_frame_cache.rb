module Joybox
  module Core

  	class SpriteFrameCache < CCSpriteFrameCache
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
  end

  def add_frame_with_name(options = {})
    addSpriteFrame(options[:frame], name: options[:name]) if options.has_key? (:frame)
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

  def default_where
  {
    from: 1,
    to: nil
  }
  end

  def where(options = {})
    options = options.nil? ? default_where : default_where.merge!(options)
    frame_prefix = options[:prefix]
    frame_suffix = options[:suffix]

    frames = Array.new

    frame_order = options[:order]
    from_frame = frame_order ? frame_order.pop : options[:from]
    to_frame = options[:to]

    frame = nil
    
    # Yukihiro Matsumoto recomends using loop instead of while or until statements
    # http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    loop do
      frame_name = "#{frame_prefix}#{from_frame}#{frame_suffix}"
      frame = self[frame_name]
      frames << frame unless frame.nil?

      from_frame = frame_order ? frame_order.pop : (from_frame + 1)
      break if frame.nil? or (from_frame > to_frame unless to_frame.nil?)
    end

    frames
  end

end
