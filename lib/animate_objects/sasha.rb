class Sasha < AnimateObject
  def name
    "a scruffy developer brandishing a CV headed 'Sasha Cooper'"
  end

  def names
    ['Sasha', 'developer', 'scruffy developer']
  end

  def description
    "He seems to want to show you something."
  end

  def converse
    puts "Have you considered reading the CV OF TRUTH?"
    response = gets.chomp.downcase
    if response.start_with? 'y'
      `open assets/Sasha_Cooper_CV.pdf`
    else
      puts "Oh."
    end
  end
end
