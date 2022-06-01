# frozen_string_literal: true

RSpec.describe Lib::CodebrakerConsole do
  describe '#exit' do
    subject { described_class.new }

    it 'exit app' do
      expect(subject).to receive(:exit)
      subject.exit_command
    end
  end
end
