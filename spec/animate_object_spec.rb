require 'animate_object'
require 'rspec'

describe AnimateObject do
  context '#pickupable?' do
    it 'is not pickupable' do
      expect(subject).not_to be_pickupable
    end
  end

  context '#converse' do
    it 'requires implementation of #converse' do
      expect { subject.converse }.to raise_error { NotImplementedError }
    end
  end
end
