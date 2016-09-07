require 'game_engine'
require 'rspec'

describe PickingUp do
  let(:env_subject) { double(:subject) }
  let(:environment) { { subject: env_subject } }
  subject { PickingUp.new(environment) }

  context '#description' do
    it "asks the current environment's subject to describe being picked up" do
      expect(env_subject).to receive(:describe_pickup)

      subject.description
    end
  end

  context '#run' do
    it 'just runs the previous state if it cannot be picked up' do
      allow(env_subject).to receive(:pickupable?).and_return false
      previous_state = double :state
      environment[:previous_state] = previous_state
      expect(previous_state).to receive(:run).with('Take angry dwarf')

      subject.run('Take angry dwarf')
    end
  end
end
