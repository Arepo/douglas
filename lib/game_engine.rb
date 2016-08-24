require 'pry'

class Game
  def run(state)
    while (input = prompt)
# binding.pry
      state = state.run(input)
      puts state.description

      unless state.items.empty?
        puts
        state.items.each do |item|
          puts "There is #{item.name} here."
        end
      end

      unless state.inventory.empty?
        puts
        puts "You are carrying the following items in your satchel:"
        state.inventory.each do |item|
          puts "- #{item.name}"
        end
      end
    end
  end

  def prompt
    $stdout << '> '

    gets.to_s.strip
  end
end

class State
  attr_reader :environment

  def initialize(environment)
    @environment = environment
  end

  def run(input)
    case input
    when "help", "h"
      Help.new(environment.merge(previous_state: self))
    when "look", "l"
      self
    when /look at (.+)/i
      Looking.new(update_environment($1))
    when /(quit|exit)/i
      Quit.new(environment)
    when /pick up|take (.+)/i
      PickingUp.new(update_environment($1))
    when /talk to|talk (.+)/i
      Conversation.new(update_environment($1))
    else
      self
    end
  end

  def items
    []
  end

  def name
    environment.fetch(:name)
  end

  def previous_state
    environment.fetch(:previous_state)
  end

  def subject
    environment.fetch(:subject)
  end

  def inventory
    environment.fetch(:inventory, [])
  end

  def update_environment(current_subject)
    environment.merge(previous_state: self, subject: items.find { |item| item.names.include?(current_subject) })
  end
end

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
    when 1
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

class OutsideOffices < State
  def run(input)
    case input
    when /east/i
      Reception.new(environment.merge(reception: { items: [] }))
    else
      super
    end
  end

  def items
    environment.fetch(:outside_offices).fetch(:items) + [Statues.new, ConfusedMemberOfThePublic.new]
  end

  def description
    <<-DESC
      You are standing outside some glorious corporate offices.

      There are shiny glass doors to the east.
    DESC
  end
end

class Reception < State
  def run(input)
    case input
    when /west/i
      OutsideOffices.new(environment)
    else
      super
    end
  end

  def items
    environment.fetch(:reception).fetch(:items) + [Receptionist.new, Sasha.new]
  end

  def description
    <<-DESC
      Behind the reception desk, you spy a bland corporate logo.

      You can exit to the west.
    DESC
  end
end

class Sasha
  def name
    "a scruffy developer brandishing a CV, headed 'Sasha Cooper'"
  end

  def pickupable?
    true
  end

  def names
    ['Sasha', 'developer']
  end

  def description
    "He seems to want to show you something"
  end

  def conversational?
    true
  end

  def disposition
    "at you as though you were one of the Chosen Few"
  end

  def converse
    puts "Have you considered reading the CV OF TRUTH?"
    response = gets.chomp.downcase
    if response.start_with? 'y'
      `open ../assets/Sasha_Cooper_CV.pdf`
    else
      "Oh."
    end
  end
end

class Receptionist
  def name
    "a grumpy-looking receptionist"
  end

  def pickupable?
    false
  end

  def names
    ['receptionist', 'grumpy receptionist']
  end

  def description
    "They don't look very happy at all."
  end

  def conversational?
    true
  end
end

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

class Statues
  def name
    "a pair of weird statues"
  end

  def pickupable?
    false
  end

  def names
    ['weird statues', 'pair of weird statues', 'a pair of weird statues', 'statues', 'statue', 'art', 'faces']
  end

  def description
    "The statues fill you with an unprecedented sense of serenity."
  end
end

class ConfusedMemberOfThePublic
  def name
    "a confused member of the public"
  end

  def pickupable?
    false
  end

  def names
    ["confused member of the public", "member of the public"]
  end

  def description
    "They look very confused indeed"
  end

  def conversational?
    true
  end
end

class AccessCard < Inanimate
  def name
    "an access card"
  end

  def pickupable?
    true
  end

  def names
    ["access card", "card"]
  end

  def description
    "Some sort of access card with quite an ugly mug on it. The name reads \"Tarquin Thunder\"."
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

class Inanimate
  def conversational?
    false
  end
end

class Animate
  def conversational?
    true
  end

  def pickupable?
    false
  end
end

trap 'INT' do
  puts "Byesibye!"
  exit
end


