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
