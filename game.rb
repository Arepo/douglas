require_relative 'lib/game_engine'

puts "\e[2J"
puts "Greetings, traveller! What is your name?"
Game.new.run(Greeting.new({}))
