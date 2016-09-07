require 'inanimate_object'
require 'rspec'

describe InanimateObject do
  context '#conversational?' do
    it 'is not conversational' do
      expect(subject).not_to be_conversational
    end
  end

  context '#pickupable?' do
    it 'expects subclasses to implement the method' do
      expect { subject.pickupable? }.to raise_error { NotImplementedError }
    end
  end
end
