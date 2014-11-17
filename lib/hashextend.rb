module HashExtendPermissions
  def permit(*keys)
    return self.dup.keep_if{|k,v| keys.flatten.map(&:to_s).include? k.to_s}
  end
  def +(hash)
    return self.merge(hash)
  end
end

class Hash
  prepend HashExtendPermissions
end
