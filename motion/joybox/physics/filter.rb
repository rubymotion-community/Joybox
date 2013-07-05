Joybox::Physics::Filter = B2DFilter

class B2DFilter

  alias_method :category_bits, :categoryBits
  alias_method :category_bits=, :setCategoryBits
  alias_method :mask_bits, :maskBits
  alias_method :mask_bits=, :setMaskBits
  #alias_method :group_index, :groupIndex
  #alias_method :group_index=, :setGroupIndex
  
  def group_index
    groupIndex
  end

  def group_index=(group_index)
    setGroupIndex(group_index)
  end
end