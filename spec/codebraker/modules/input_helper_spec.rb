# frozen_string_literal: true

RSpec.describe Modules::InputHelper do
  subject(:dummy) { Class.new { include Modules::InputHelper }.new }

  describe '#player_name' do
    let(:valid_name) { FFaker::Name.first_name }
    let(:invalid_name) { FFaker::Name.first_name[2] }

    it 'return if name valid' do
      allow(dummy).to receive(:gets).and_return(valid_name)
      expect(dummy.input_player_name).to eq({ type: :input, value: valid_name })
    end

    it 'retry if name invalid' do
      allow(dummy).to receive(:gets).and_return(invalid_name, valid_name)
      expect(dummy.input_player_name).to eq({ type: :input, value: valid_name })
      dummy.input_player_name
    end

    it 'return exit if input exit' do
      allow(dummy).to receive(:gets).and_return('exit')
      expect(dummy.input_player_name).to eq({ type: :command, value: 'exit' })
    end
  end

  describe '#scenario_commands' do
    let(:valid_command) { 'start' }
    let(:invalid_command) { 'starttt' }

    it 'return command if command valid' do
      allow(dummy).to receive(:gets).and_return(valid_command)
      expect(dummy.input_scenario_command).to eq(valid_command)
    end

    it 'retry if command invalid' do
      allow(dummy).to receive(:gets).and_return(invalid_command, valid_command)
      expect(dummy.input_scenario_command).to eq(valid_command)
      dummy.input_scenario_command
    end
  end

  describe '#difficulty' do
    let(:valid_difficulty) { Codebraker::Constants::DIFFICULTIES.keys.sample.to_s }
    let(:invalid_difficulty) { 'difficulty' }

    it 'pass if difficulty valid' do
      allow(dummy).to receive(:gets).and_return(valid_difficulty)
      expect(dummy.input_difficulty).to eq({ type: :input, value: valid_difficulty })
    end

    it 'retry if difficulty invalid' do
      allow(dummy).to receive(:gets).and_return(invalid_difficulty, valid_difficulty)
      expect(dummy.input_difficulty).to eq({ type: :input, value: valid_difficulty })
      dummy.input_difficulty
    end
  end

  describe '#guess' do
    let(:valid_guess) { '3562' }
    let(:invalid_guess) { 'h781' }
    let(:valid_command) { 'hint' }

    it 'returns hint if user puts valid command' do
      allow(dummy).to receive(:gets).and_return(valid_command)
      expect(dummy.input_guess).to eq({ type: :command, value: valid_command })
    end

    it 'returns difficulty if difficulty is valid' do
      allow(dummy).to receive(:gets).and_return(valid_guess)
      expect(dummy.input_guess).to eq({ type: :input, value: valid_guess })
      dummy.input_guess
    end

    it 'returns exit if player inputs exit' do
      allow(dummy).to receive(:gets).and_return('exit')
      expect(dummy.input_guess).to eq({ type: :command, value: 'exit' })
    end

    it 'raise error if guess is not valid' do
      allow(dummy).to receive(:gets).and_return(invalid_guess, valid_guess)
      expect(dummy.input_guess).to eq({ type: :input, value: valid_guess })
      dummy.input_guess
    end
  end

  describe '#save_result' do
    let(:valid_answer) { Modules::Constants::AGREE_COMMAND }
    let(:invalid_answer) { FFaker::Name.first_name }

    it 'receive yes' do
      allow(dummy).to receive(:gets).and_return(valid_answer)
      expect(dummy.input_approve_command).to eq(valid_answer)
    end

    it 'receive wrong command' do
      allow(dummy).to receive(:gets).and_return(invalid_answer, valid_answer)
      expect(dummy.input_approve_command).to eq(valid_answer)
      dummy.input_approve_command
    end
  end
end
