class CCNode

  alias_method :add_child, :addChild

  def << (node)

    self.addChild(node)
  end

  #TODO: Revisar el nombre de este metodo
  def add_childs(*nodes)

    nodes.each do |node|

      self.addChild(node)

    end

  end 

end