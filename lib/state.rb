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
      Looking.new(updated_environment($1))
    when /(quit|exit)/i
      Quit.new(environment)
    when /(pick up |take )(.+)/i
      PickingUp.new(updated_environment($2))
    when /(talk to |talk )(.+)/i
      Conversation.new(updated_environment($2))
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

  def updated_environment(current_subject)
    environment.merge(
      previous_state: self,
      subject: items.find { |item| item.names.map(&:downcase).include?(current_subject) }
    )
  end
end
