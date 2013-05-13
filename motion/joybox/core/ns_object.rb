class NSObject

  def init
    self.send(:initialize)
    self
  end

end