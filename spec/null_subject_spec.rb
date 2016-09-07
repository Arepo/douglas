require 'game_engine'
require 'rspec'

describe NullSubject do
  context '#converse' do
    it "prints a nully string" do
      expect(subject).to receive(:puts).with(/absently mumble/)
      subject.converse
    end
  end

  context '#describe_pickup' do
    it "prints a different nully string" do
      expect(subject).to receive(:puts).with(/^(?!.*absently mumble).*$/)
      subject.describe_pickup
    end
  end

  context '#pickupable?' do
    it "is not pickupable" do
      expect(subject).not_to be_pickupable
    end
  end
end
