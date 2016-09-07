require 'game_engine'
require 'rspec'

describe Conversation do
  let(:env_subject) { double(:subject, converse: nil) }
  let(:environment) { { subject: env_subject } }
  subject { Conversation.new(environment) }

  context '#description' do
    it 'has no description' do
      expect(subject.description).to be nil
    end
  end

  context '#new' do
    it "triggers a conversation with the environment's current subject" do
      expect(env_subject).to receive(:converse)
      Conversation.new(environment)
    end
  end

  context '#run' do
    it "runs the previous state" do
      previous_state = double :state
      environment[:previous_state] = previous_state
      expect(previous_state).to receive(:run).with('Eat impregnable door')

      subject.run('Eat impregnable door')
    end
  end
end
