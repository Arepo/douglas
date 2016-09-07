class InanimateObject
  def conversational?
    false
  end

  def pickupable?
    raise NotImplementedError
  end
end
