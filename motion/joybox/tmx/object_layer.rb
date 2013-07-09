Joybox::TMX::ObjectLayer = CCTMXObjectGroup

class CCTMXObjectGroup
  alias_method :name, :groupName
  alias_method :offset, :positionOffset

  def [](key)
    objectNamed(key)
  end

end