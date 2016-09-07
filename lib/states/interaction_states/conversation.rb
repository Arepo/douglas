class Conversation < State
  def initialize(environment)
    super
    converse
  end

  def run(input)
    previous_state.run(input)
  end

  def description
    # No-op
  end

  private

  def converse
    subject.converse
  end
end
