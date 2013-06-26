class ChainShape < B2DChainShape

  extend Joybox::Common::Initialize

  def initialize(options = {})
    init
    initialize_with_loop(options) if options.has_key? :loop
    initialize_with_chain(options) if options.has_key? :chain
  end

  def initialize_with_loop(options = {})
    vertices = Pointer.new(CGPoint.type, options[:loop].size)
    options[:loop].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).to_pixel_coordinates
    end
    
    createLoopWithVertices(vertices, andVertexCount: options[:loop].size)
  end

  def initialize_with_chain(options = {})
    vertices = Pointer.new(CGPoint.type, options[:chain].size)
    options[:chain].each_with_index do |vertex, index|
      vertices[index] = CGPointMake(vertex[0], vertex[1]).to_pixel_coordinates
    end

    createChainWithVertices(vertices, andVertexCount: options[:chain].size)
  end

end