require 'game_engine'
require 'rspec'

describe AnimateObject do
  context '#converse' do
    it 'requires implementation of #converse' do
      expect { subject.converse }.to raise_error { NotImplementedError }
    end
  end

  context '#describe_pickup' do
    it 'prints an animate string' do
      expect(subject).to receive(:puts).with(/advise/)
      subject.describe_pickup
    end
  end

  context '#pickupable?' do
    it 'is not pickupable' do
      expect(subject).not_to be_pickupable
    end
  end
end
