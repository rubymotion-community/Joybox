Joybox::Physics::PolygonShape = B2DPolygonShape

class B2DPolygonShape

  extend Joybox::Common::Initialize

  alias_method :vertices_count, :vertexCount
  alias_method :metric_centroid, :centroid
  alias_method :metric_vertices, :vertices
  alias_method :metric_normals, :normals

  def initialize(options = {})
    initialize_with_box(options) if options.has_key? :box
    initialize_with_vertices(options) if options.has_key? :vertices
  end

  def initialize_with_box(options = {})
    half_width = (options[:box][0]).from_pixels
    half_height = (options[:box][1]).from_pixels

    initWithHalfWidth(half_width, 
                      andHalfHeight: half_height) unless options.has_key? :center
    initWithHalfWidth(half_width, 
                      halfHeight: half_height, 
                      center: options[:center], 
                      andAngle: options[:angle]) if options.has_key? :center
  end

  def initialize_with_vertices(options = {})
    vertices = Pointer.new(CGPoint.type, options[:vertices].size)
    options[:vertices].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).from_pixel_coordinates
    end

    initWithVertices(vertices, andVertexCount: options[:vertices].size)
  end

  def centroid
    metric_centroid.to_pixel_coordinates
  end

  def vertices
    Array.new(vertices_count){ |i| metric_vertices[i].to_pixel_coordinates }
  end

  def normals
    Array.new(vertices_count){ |i| metric_normals[i].to_pixel_coordinates }
  end

  def vertex_by_index(index)
    getVertex(index).to_pixel_coordinates
  end

end