# frozen_string_literal: true

RSpec.describe Modules::Validation do
  subject(:klass) { (Class.new { include Modules::Validation }).new }

  describe '#validate scenario command' do
    let(:valid_command) { Modules::Constants::SCENARIO_COMMANDS.sample }
    let(:invalid_command) { 'some command' }

    it 'returns nil if command is valid' do
      expect(klass.scenario_command_validate!(valid_command)).to be_nil
    end

    it 'returns error message if command is not valid' do
      expect { klass.scenario_command_validate!(invalid_command) }.to raise_error(Modules::Errors::WrongScenarioError)
    end
  end

  describe '#validate approve commands' do
    let(:valid_command) { Modules::Constants::APPROVAL_COMMANDS.sample }
    let(:invalid_command) { 'some command' }

    it 'returns nil if command is valid' do
      expect(klass.approve_command_validate!(valid_command)).to be_nil
    end

    it 'returns error message if command is not valid' do
      expect do
        klass.approve_command_validate!(invalid_command)
      end.to raise_error(Modules::Errors::WrongApproveCommandError)
    end
  end
end
