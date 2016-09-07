require 'animate_object'
require 'rspec'

describe AnimateObject do
  it 'is not pickuppable' do
    expect(subject).not_to be_pickupable
  end

  it 'is conversational' do
    expect(subject).to be_conversational
  end
end
