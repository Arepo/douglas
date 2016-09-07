class Receptionist < AnimateObject
  def name
    "a grumpy-looking receptionist"
  end

  def names
    ['receptionist', 'grumpy receptionist', 'grumpy-looking receptionist']
  end

  def description
    "They don't look very happy at all."
  end

  def converse
    puts "He seems unimpressed by your flirtatious advances."
  end
end
