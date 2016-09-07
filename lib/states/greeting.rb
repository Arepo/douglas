class Greeting < State
  def run(name)
    if name.strip.empty?
      self.class.new(environment.merge(name_attempts: name_attempts + 1))
    else
      check_awesomeness(name)
      OutsideOffices.new(environment.merge(name: name, outside_offices: { items: [AccessCard.new] }))
    end
  end

  def description
    case name_attempts
    when 2
      "No need to be shy; pray tell, what is your name?"
    when 5
      "Cut me some slack here, I'm going to keep asking you forever. WHAT IS THE NAME?"
    else
      "Seriously! What's your name?"
    end
  end

  def name_attempts
    environment.fetch(:name_attempts, 1)
  end

  def check_awesomeness(name)
    puts "That is an awesome name" if name.match(/^Sasha|Arepo/i)
  end
end
