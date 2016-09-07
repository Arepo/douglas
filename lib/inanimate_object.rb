class InanimateObject
  def converse
    puts "#{name.capitalize} stares back inanimately. You think better of the conversation."
  end

  def describe_pickup
    if pickupable?
      puts "You pick up #{name} and put it neatly in your satchel."
    else
      puts "You can't possibly pick up #{name}, you mad horse!"
    end
  end

  def name
    raise NotImplementedError, 'Implement #name'
  end

  def pickupable?
    raise NotImplementedError, 'Implement #pickupable'
  end
end
