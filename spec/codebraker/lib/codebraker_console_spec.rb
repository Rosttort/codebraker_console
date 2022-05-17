# frozen_string_literal: true

RSpec.describe Lib::CodebrakerConsole do
  describe '#exit' do
    subject(:console) { described_class.new }

    it 'exit app' do
      expect(console).to receive(:exit)
      console.exit_command
    end
  end
end
