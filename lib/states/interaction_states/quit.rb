class Quit < State
  def run(_input)
    exit
  end

  def description
    "Any last words?"
  end
end
