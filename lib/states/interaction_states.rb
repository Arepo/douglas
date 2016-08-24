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

class Conversation < State
  def initialize(environment)
    super
    converse
  end

  def run(input)
    previous_state.run(input)
  end

  def converse
    if subject && subject.conversational?
      puts "#{subject.name} looks #{subject.disposition} and says '#{subject.conversation}'"
      subject.converse
    elsif subject
      puts "#{subject.name} stares back inanimately. You think better of the conversation."
    else
      puts "You absently mumble to your lost love, hoping they can hear you, wherever they are."
    end
  end

  def description
    "And there, the conversation ends."
  end
end

class Looking < State
  def run(input)
    previous_state.run(input)
  end

  def description
    return "I can't see any such thing" unless subject

    subject.description
  end
end

class Help < State
  def run(input)
    previous_state.run(input)
  end

  def description
    <<-DESC
      You can try to pick things up by typing "pick up SOMETHING", you can try
      to look at things by typing "look at SOMETHING". Other than that, I
      can't help you, #{name}!
    DESC
  end
end

class Quit < State
  def run(_input)
    exit
  end

  def description
    "Any last words?"
  end
end
