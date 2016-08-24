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
