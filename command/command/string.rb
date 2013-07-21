class String

  def underscore
    gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def titleize
    gsub(/([A-Z])/, '_\1').split(/_/).map(&:capitalize).join
  end

end