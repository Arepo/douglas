require 'game_engine'
require 'rspec'

describe Greeting do
  let(:environment) { double :environment }
  let(:greeting) { Greeting.new(environment) }

  it "Recognises an awesome name when it hears one" do
    expect(greeting).to receive(:puts).with("That is an awesome name")
    greeting.check_awesomeness('Sasha')
  end
end
