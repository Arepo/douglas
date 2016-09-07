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
