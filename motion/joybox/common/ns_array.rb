class NSArray

  alias_method :max_old, :max

  def to_point
    CGPointMake(self[0], self[1]) if size == 2
  end

  def to_size
    CGSizeMake(self[0], self[1]) if size == 2
  end

  def to_rect
    CGRectMake(self[0], self[1], self[2], self[3]) if size == 4
  end

end