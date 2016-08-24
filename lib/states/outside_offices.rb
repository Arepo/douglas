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
