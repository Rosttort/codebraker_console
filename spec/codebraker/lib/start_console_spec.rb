# frozen_string_literal: true

RSpec.describe Lib::StartConsole do
  subject { described_class.new }

  describe '#run' do
    it 'output welcome text' do
      expect(subject).to receive(:game_menu)
      subject.run
    end
  end

  describe '#start' do
    let(:registration_console_double) { instance_double(Lib::RegistrationConsole) }

    it 'call registration console when start' do
      expect(subject).to receive(:game_menu)
      subject.run
    end
  end

  describe '#rules' do
    it 'output rules' do
      expect(subject).to receive(:game_menu)
      subject.run
    end
  end

  describe '#game_menu' do
    it 'call start_command when start' do
      allow(subject).to receive(:input_scenario_command).and_return(Modules::Constants::SCENARIO_COMMANDS[:start])
      expect(subject).to receive(:start_command)
      subject.run
    end

    it 'call rules_command when rules' do
      allow(subject).to receive(:input_scenario_command).and_return(Modules::Constants::SCENARIO_COMMANDS[:rules])
      expect(subject).to receive(:rules_command)
      subject.run
    end

    it 'call rating_command when rating' do
      allow(subject).to receive(:input_scenario_command).and_return(Modules::Constants::SCENARIO_COMMANDS[:rating])
      expect(subject).to receive(:rating_command)
      subject.run
    end

    it 'call exit_command when exit' do
      allow(subject).to receive(:input_scenario_command).and_return(Modules::Constants::SCENARIO_COMMANDS[:exit])
      expect(subject).to receive(:exit_command)
      subject.run
    end
  end

  describe '#rating' do
    let(:records) do
      [
        {
          rating: 1,
          name: 'Ame',
          difficulty: :easy,
          attempts_max: 15,
          attempts: 1,
          hints_max: 2,
          hints: 0
        },
        {
          rating: 2,
          name: 'Liza',
          difficulty: :easy,
          attempts_max: 15,
          attempts: 2,
          hints_max: 2,
          hints: 0
        }
      ]
    end

    it 'shows rating' do
      expect(subject).to receive(:game_menu)
      subject.run
    end
  end
end
