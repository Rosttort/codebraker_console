# frozen_string_literal: true

RSpec.describe Modules::InputHelper do
  subject{ Class.new { include Modules::InputHelper }.new }

  describe '#player_name' do
    let(:valid_name) { FFaker::Name.first_name }
    let(:invalid_name) { FFaker::Name.first_name[2] }

    it 'return if name valid' do
      allow(subject).to receive(:gets).and_return(valid_name)
      expect(subject.input_player_name).to eq({ type: :input, value: valid_name })
    end

    it 'retry if name invalid' do
      allow(subject).to receive(:gets).and_return(invalid_name, valid_name)
      expect(subject.input_player_name).to eq({ type: :input, value: valid_name })
      subject.input_player_name
    end

    it 'return exit if input exit' do
      allow(subject).to receive(:gets).and_return(Modules::Constants::EXIT_COMMAND)
      expect(subject.input_player_name).to eq({ type: :command, value: Modules::Constants::EXIT_COMMAND})
    end
  end

  describe '#scenario_commands' do
    let(:valid_command) { Modules::Constants::SCENARIO_COMMANDS[:start] }
    let(:invalid_command) { 'starttt' }

    it 'return command if command valid' do
      allow(subject).to receive(:gets).and_return(valid_command)
      expect(subject.input_scenario_command).to eq(valid_command)
    end

    it 'retry if command invalid' do
      allow(subject).to receive(:gets).and_return(invalid_command, valid_command)
      expect(subject.input_scenario_command).to eq(valid_command)
      subject.input_scenario_command
    end
  end

  describe '#difficulty' do
    let(:valid_difficulty) { Codebraker::Constants::DIFFICULTIES.keys.sample.to_s }
    let(:invalid_difficulty) { 'difficulty' }

    it 'pass if difficulty valid' do
      allow(subject).to receive(:gets).and_return(valid_difficulty)
      expect(subject.input_difficulty).to eq({ type: :input, value: valid_difficulty })
    end

    it 'retry if difficulty invalid' do
      allow(subject).to receive(:gets).and_return(invalid_difficulty, valid_difficulty)
      expect(subject.input_difficulty).to eq({ type: :input, value: valid_difficulty })
      subject.input_difficulty
    end
  end

  describe '#guess' do
    let(:valid_guess) { '3562' }
    let(:invalid_guess) { 'h781' }
    let(:valid_command) { Modules::Constants::GAME_COMMANDS[:hint] }

    it 'returns hint if user puts valid command' do
      allow(subject).to receive(:gets).and_return(valid_command)
      expect(subject.input_guess).to eq({ type: :command, value: valid_command })
    end

    it 'returns difficulty if difficulty is valid' do
      allow(subject).to receive(:gets).and_return(valid_guess)
      expect(subject.input_guess).to eq({ type: :input, value: valid_guess })
      subject.input_guess
    end

    it 'returns exit if player inputs exit' do
      allow(subject).to receive(:gets).and_return(Modules::Constants::SCENARIO_COMMANDS[:exit])
      expect(subject.input_guess).to eq({ type: :command, value: Modules::Constants::SCENARIO_COMMANDS[:exit] })
    end

    it 'raise error if guess is not valid' do
      allow(subject).to receive(:gets).and_return(invalid_guess, valid_guess)
      expect(subject.input_guess).to eq({ type: :input, value: valid_guess })
      subject.input_guess
    end
  end

  describe '#save_result' do
    let(:valid_answer) { Modules::Constants::AGREE_COMMAND }
    let(:invalid_answer) { FFaker::Name.first_name }

    it 'receive yes' do
      allow(subject).to receive(:gets).and_return(valid_answer)
      expect(subject.input_approve_command).to eq(valid_answer)
    end

    it 'receive wrong command' do
      allow(subject).to receive(:gets).and_return(invalid_answer, valid_answer)
      expect(subject.input_approve_command).to eq(valid_answer)
      subject.input_approve_command
    end
  end
end
