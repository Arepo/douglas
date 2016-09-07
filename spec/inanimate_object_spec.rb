require 'inanimate_object'
require 'rspec'

describe InanimateObject do
  it 'is not conversational' do
    expect(subject).not_to be_conversational
  end

  it 'does not implement pickupable?' do
    expect { subject.pickupable? }.to raise_error { NotImplementedError }
  end
end
