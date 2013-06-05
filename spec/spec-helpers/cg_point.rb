class CGPoint
  def close? (to, delta)
    self.x.close? (to.x, delta) && self.y.close? (to.y, delta)
  end
end