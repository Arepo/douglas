class AnimateObject
  def converse
    raise NotImplementedError
  end

  def describe_pickup
    "As your self-appointed lawyer, I advise against it."
  end

  def pickupable?
    false
  end
end
