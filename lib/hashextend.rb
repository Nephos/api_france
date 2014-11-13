module HashExtendPermissions
  def permit(*keys)
    return self.keep_if{|k,v| keys.map(&:to_s).include? k.to_s}
  end
end

class Hash
  prepend HashExtendPermissions
end
