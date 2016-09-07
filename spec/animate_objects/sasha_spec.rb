require 'game_engine'
require 'rspec'

describe Sasha do
  context '#converse' do
    it "offers a CV, and is somewhat disappointed if you don't look at it" do
      expect(subject).to receive(:puts).once.with(/CV/)
      allow(subject).to receive(:gets).and_return('No, bugger off you rapscallion.')
      expect(subject).to receive(:puts).once.with("'Oh.'")

      subject.converse
    end

    it 'seems pleased (and produces the CV) if you do' do
      allow(subject).to receive(:puts).once.with(/CV/)
      allow(subject).to receive(:gets).and_return('Yes indeedely doodly!')
      expect(subject).to receive(:puts).once.with(/Eeexcellent/)
      expect(subject).to receive(:system).with('open', 'assets/Sasha_Cooper_CV.pdf')

      subject.converse
    end
  end

  context '#description' do
    it 'has scintillating powers of mime' do
      expect(subject.description).to match(/show you something/)
    end
  end

  context '#name' do
    it 'has an awesome name' do
      expect(subject.name).to match(/Sasha Cooper/)
    end
  end

  context '#names' do
    it 'is known and cherished by many names' do
      expect(subject.names).to include 'sasha',
                                       'developer',
                                       'scruffy developer'
    end
  end
end
