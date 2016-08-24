class AccessCard < InanimateObject
  def name
    "an access card"
  end

  def pickupable?
    true
  end

  def names
    ["access card", "card"]
  end

  def description
    "Some sort of access card with quite an ugly mug on it. The name reads \"Tarquin Thunder\"."
  end
end
