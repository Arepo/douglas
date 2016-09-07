require 'game_engine'
require 'rspec'

describe InanimateObject do
  before do
    allow(subject).to receive(:name).and_return('thing')
  end

  context '#converse' do
    it 'prints an inanimate string' do
      expect(subject).to receive(:puts).with(/inanimately/)
      subject.converse
    end
  end

  context '#describe_pickup' do
    it "prints a pick uppy string if it's pickupable" do
      expect(subject).to receive(:puts).with(/pick up/)
      allow(subject).to receive(:pickupable?).and_return true
      subject.describe_pickup
    end

    it "prints a different string if it's not pickupable" do
      expect(subject).to receive(:puts).with(/(?!.*pick up).*/)
      allow(subject).to receive(:pickupable?).and_return false
      subject.describe_pickup
    end
  end

  context '#name' do
    it 'expects subclasses to implement the #name method' do
      allow(subject).to receive(:name).and_call_original
      expect { subject.name }.to raise_error { NotImplementedError }
    end
  end

  context '#pickupable?' do
    it 'expects subclasses to implement the #pickupable method' do
      expect { subject.pickupable? }.to raise_error { NotImplementedError }
    end
  end
end
