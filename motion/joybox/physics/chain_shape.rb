Joybox::Physics::ChainShape = B2DChainShape

class B2DChainShape

  extend Joybox::Common::Initialize

  alias_method :metric_vertices, :vertices
  alias_method :has_previous_vertex?, :hasPreviousVertex
  alias_method :has_next_vertex?, :hasNextVertex
  alias_method :metric_previous_vertex, :previousVertex
  alias_method :metric_previous_vertex=, :setPreviousVertex
  alias_method :metric_next_vertex, :nextVertex
  alias_method :metric_next_vertex=, :setNextVertex

  def initialize(options = {})
    init
    initialize_with_loop(options) if options.has_key? :loop
    initialize_with_chain(options) if options.has_key? :chain
  end

  def initialize_with_loop(options = {})
    vertices = Pointer.new(CGPoint.type, options[:loop].size)
    options[:loop].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).from_pixel_coordinates
    end
    
    createLoopWithVertices(vertices, andVertexCount: options[:loop].size)
  end

  def initialize_with_chain(options = {})
    vertices = Pointer.new(CGPoint.type, options[:chain].size)
    options[:chain].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).from_pixel_coordinates
    end

    createChainWithVertices(vertices, andVertexCount: options[:chain].size)
  end

  def vertices_count
    vertexCount
  end

  def vertices
    Array.new(vertices_count){ |i| metric_vertices[i].to_pixel_coordinates }
  end

  def previous_vertex
    previousVertex.to_pixel_coordinates
  end

  def previous_vertex=(vertex)
    vertex = vertex.to_point unless vertex.is_a? (CGPoint)
    setPreviousVertex(vertex.from_pixel_coordinates)
  end

  def next_vertex
    nextVertex.to_pixel_coordinates
  end

  def next_vertex=(vertex)
    vertex = vertex.to_point unless vertex.is_a? (CGPoint)
    setNextVertex(vertex.from_pixel_coordinates)
  end

  def edge_shape_by_index(index)
    edge_shape = EdgeShape.new start_point: [0, 0], end_point: [0, 0]
    getChildEdge(edge_shape, withIndex: index)
    edge_shape
  end

end