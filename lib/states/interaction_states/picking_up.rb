class PickingUp < State
  def run(input)
    if subject.pickupable?
      previous_state.class.new(previous_state.environment.merge(items: [], inventory: inventory + [subject])).run(input)
    else
      previous_state.run(input)
    end
  end

  def description
    subject.describe_pickup
  end
end
