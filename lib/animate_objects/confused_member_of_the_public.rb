class ConfusedMemberOfThePublic < AnimateObject
  def name
    'a confused member of the public'
  end

  def names
    ["confused member of the public", "member of the public", "public"]
  end

  def description
    "They look very confused indeed"
  end

  def converse
    puts "'I feel very confused indeed'"
  end
end
