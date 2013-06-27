class NSArray

  def to_point
    if size == 2
      CGPointMake(self[0], self[1])
    end 
  end

end