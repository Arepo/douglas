class NullSubject
  def converse
    puts "You absently mumble to your lost love, hoping they can hear you, wherever they are."
  end

  def describe_pickup
    puts "I can't pick up something I can't see!"
  end

  def pickupable?
    false
  end
end
