Joybox::Physics::CircleShape = B2DCircleShape

class B2DCircleShape

  extend Joybox::Common::Initialize

  alias_method :vertices_count, :vertexCount
  alias_method :metric_position, :position

  def initialize(options = {})
    initWithRadius(options[:radius].from_pixels)
  end

  def position
    metric_position.to_pixel_coordinates
  end

  def support_vertex_index_by_direction(direction)
    direction = direction.to_point unless direction.is_a? (CGPoint)
    getSupport(direction.from_pixel_coordinates)
  end

  def support_vertex_by_direction(direction)
    direction = direction.to_point unless direction.is_a? (CGPoint)
    getSupportVertex(direction.from_pixel_coordinates).to_pixel_coordinates
  end

  def vertex_by_index(index)
    getVertex(index).to_pixel_coordinates
  end
end