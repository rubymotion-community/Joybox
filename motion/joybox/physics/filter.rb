Joybox::Physics::Filter = B2DFilter

class B2DFilter

  alias_method :category_bits, :categoryBits
  alias_method :category_bits=, :setCategoryBits
  alias_method :mask_bits, :maskBits
  alias_method :mask_bits=, :setMaskBits
  
  def group_index
    groupIndex
  end

  def group_index=(group_index)
    setGroupIndex(group_index)
  end
end