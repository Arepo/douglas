require 'pry'
Dir["#{File.dirname(__FILE__)}/**/*.rb"].each { |file| require(file) }

class Game
  def run(state)
    while (input = prompt)
      state = state.run(input)
      puts state.description

      unless state.items.empty?
        puts
        state.items.each do |item|
          puts "There is #{item.name} here."
        end
      end

      unless state.inventory.empty?
        puts
        puts "You are carrying the following items in your satchel:"
        state.inventory.each do |item|
          puts "- #{item.name}"
        end
      end
    end
  end

  def prompt
    $stdout << '> '

    gets.to_s.strip
  end
end

trap 'INT' do
  puts "Byesibye!"
  exit
end


