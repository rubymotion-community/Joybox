class CCNode

  alias_method :add_child, :addChild

  def << (node)

    self.addChild(node)
  end

end