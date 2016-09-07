class AnimateObject
  def conversational?
    true
  end

  def pickupable?
    false
  end

  def converse
    raise NotImplementedError
  end
end
