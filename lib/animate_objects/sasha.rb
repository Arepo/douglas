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
