class CCNode

  alias_method :add_child, :addChild
  alias_method :run_action, :runAction
  alias_method :stop_action, :stopAction
  alias_method :stop_all_actions, :stopAllActions
  alias_method :number_of_running_actions, :numberOfRunningActions

  def << (node)
    self.addChild(node)
  end

  def self.inherited(base)
    base.send(:include, Joybox)
  end

  def add_children(*nodes)
    nodes.each do |node|
      self.addChild(node)
    end
  end 

  def schedule_update(&block)
    @schedule_update_block = block if block_given?
    scheduleUpdate
  end

  def update(dt)
    @schedule_update_block.call(dt) if @schedule_update_block
  end

  def running_actions?
    self.number_of_running_actions > 0
  end

end