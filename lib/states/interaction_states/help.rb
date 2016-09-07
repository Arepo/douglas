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
