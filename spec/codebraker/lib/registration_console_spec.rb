# frozen_string_literal: true

RSpec.describe Lib::RegistrationConsole do
  subject(:registration_console) { described_class.new }

  describe '#run' do
    subject(:game) { instance_double(Lib::GameConsole) }

    let(:player_name) { FFaker::Name.first_name[0..20] }
    let(:difficulty) { Codebraker::Constants::DIFFICULTIES.keys.sample.to_s }
    let(:player_input) { { type: :input, value: player_name } }
    let(:difficulty_input) { { type: :input, value: difficulty } }
    let(:exit_input) { { type: :command, value: 'exit' } }

    it 'run game when input correct' do
      allow(registration_console).to receive(:input_player_name).and_return(player_input)
      allow(registration_console).to receive(:input_difficulty).and_return(difficulty_input)
      allow(Lib::GameConsole).to receive(:new).with(player_name, difficulty).and_return(game)
      expect(game).to receive(:run)
      registration_console.run
    end

    it 'call exit when input exit' do
      allow(registration_console).to receive(:input_player_name).and_return(exit_input)
      allow(registration_console).to receive(:send).with(:exit_command).and_throw(:exit)
      expect { registration_console.run }.to throw_symbol :exit
    end

    it 'calls exit when user put exit in difficulty' do
      allow(registration_console).to receive(:input_player_name).and_return(player_input)
      allow(registration_console).to receive(:input_difficulty).and_return(exit_input)
      allow(registration_console).to receive(:send).with(:exit_command).and_throw(:exit)
      expect { registration_console.run }.to throw_symbol :exit
    end
  end
end
