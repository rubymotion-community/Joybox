class PolygonShape < B2DPolygonShape

  extend Joybox::Common::Initialize

  def initialize(options = {})
    initialize_with_box(options) if options.has_key? :box
    initialize_with_vertices(options) if options.has_key? :vertices
  end

  def initialize_with_box(options = {})
    half_width = (options[:box][0]).to_pixels
    half_height = (options[:box][1]).to_pixels

    initWithHalfWidth(half_width, andHalfHeight: half_height) unless options.has_key? :center
    initWithHalfWidth(half_width, 
                      andHalfHeight: half_height, 
                      center: options[:center], 
                      andAngle: options[:angle]) if options.has_key? :center
  end

  def initialize_with_vertices(options = {})
    vertices = Pointer.new(CGPoint.type, options[:vertices].size)
    options[:vertices].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).to_pixel_coordinates
    end

    initWithVertices(vertices, andVertexCount: options[:vertices].size)
  end

end