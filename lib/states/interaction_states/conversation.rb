class Conversation < State
  def initialize(environment)
    super
    converse
  end

  def run(input)
    previous_state.run(input)
  end

  def converse
    subject.converse
  end

  def description
    # No-op
  end
end
