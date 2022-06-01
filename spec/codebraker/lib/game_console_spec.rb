# frozen_string_literal: true

RSpec.describe Lib::GameConsole do
  subject { described_class.new(player_name, difficulty) }

  let(:secret_code) { subject.game.secret_code.join }
  let(:player_name) { FFaker::Name.first_name }
  let(:difficulty) { Codebraker::Constants::DIFFICULTIES.keys.sample.to_s }

  describe '#run' do
    let(:guess) { Array.new(Codebraker::Constants::CODE_LENGTH) { rand(Codebraker::Validation::CODE_NUMS) }.join.to_s }
    let(:hint_command) { Modules::Constants::GAME_COMMANDS[:hint] }

    it 'command input' do
      allow(subject).to receive(:input_guess).and_return({ type: :command, value: hint_command })
      expect(subject).to receive(:hint_command)
      subject.run
    end

    it 'guess input' do
      allow(subject).to receive(:input_guess).and_return({ type: :input, value: guess })
      expect(subject).to receive(:show_result)
      subject.run
    end
  end

  describe '#hint_command' do
    let(:hint_command) { 'hint' }
    let(:hint) { rand(1..6) }

    before do
      allow(subject).to receive(:input_guess).and_return({ type: :command, value: hint_command })
    end

    it 'give hint if hint validated' do
      expect(subject).to receive(:run)
      subject.run
    end

    it 'give no hint message if hint empty' do
      subject.game.instance_variable_set(:@hints, [])
      expect(subject).to receive(:output_no_hint_message)
      subject.run
    end
  end

  describe '#show_result' do
    let(:win_result) { { answer: '++++', status: :win, code: secret_code } }
    let(:lose_result) { { answer: '-', status: :lost, code: secret_code } }
    let(:result) { { answer: '-', status: :next } }

    context 'when user win' do
      before do
        allow(subject).to receive(:input_guess)
      end

      after { subject.show_result(win_result) }

      it 'save result if answer yes' do
        allow(subject).to receive(:input_approve_command).and_return(Modules::Constants::APPROVAL_COMMANDS[:yes])
        expect(Lib::RatingConsole).to receive(:add_data)
      end

      it 'not save result' do
        allow(subject).to receive(:input_approve_command).and_return(Modules::Constants::APPROVAL_COMMANDS[:no])
        expect(Lib::RatingConsole).not_to receive(:add_data)
      end
    end

    context 'when user lost' do
      it 'lost' do
        expect(subject).not_to receive(:run)
      end
    end

    context 'when game is not over' do
      it 'continue game' do
        expect(subject).to receive(:run)
        subject.show_result(result)
      end
    end
  end
end
