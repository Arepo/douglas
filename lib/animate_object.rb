class AnimateObject
  def converse
    raise NotImplementedError 'Implement #converse'
  end

  def describe_pickup
    puts "As your self-appointed lawyer, I advise against it."
  end

  def pickupable?
    false
  end
end
