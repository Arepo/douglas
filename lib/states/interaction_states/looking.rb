class Looking < State
  def run(input)
    previous_state.run(input)
  end

  def description
    return "I can't see any such thing" unless subject

    subject.description
  end
end
