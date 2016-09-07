class PickingUp < State
  def run(input)
    if subject && subject.pickupable?
      previous_state.class.new(previous_state.environment.merge(items: [], inventory: inventory + [subject])).run(input)
    else
      previous_state.run(input)
    end
  end

  def description
    if subject && subject.pickupable?
      "You pick up #{subject.name} and put it neatly in your satchel."
    elsif subject
      "You can't possibly pick up #{subject.name}, you mad horse!"
    else
      "I can't pick up something I can't see!"
    end
  end
end
