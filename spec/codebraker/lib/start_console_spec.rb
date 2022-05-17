# frozen_string_literal: true

RSpec.describe Lib::StartConsole do
  subject(:start_console) { described_class.new }

  describe '#run' do
    it 'output welcome text' do
      expect(start_console).to receive(:game_menu)
      start_console.run
    end
  end

  describe '#start' do
    let(:registration_console_double) { instance_double(Lib::RegistrationConsole) }

    it 'call registration console when start' do
      expect(start_console).to receive(:game_menu)
      start_console.run
    end
  end

  describe '#rules' do
    it 'output rules' do
      expect(start_console).to receive(:game_menu)
      start_console.run
    end
  end

  describe '#game_menu' do
    it 'call start_command when start' do
      allow(start_console).to receive(:input_scenario_command).and_return('start')
      expect(start_console).to receive(:start_command)
      start_console.run
    end

    it 'call rules_command when rules' do
      allow(start_console).to receive(:input_scenario_command).and_return('rules')
      expect(start_console).to receive(:rules_command)
      start_console.run
    end

    it 'call rating_command when rating' do
      allow(start_console).to receive(:input_scenario_command).and_return('rating')
      expect(start_console).to receive(:rating_command)
      start_console.run
    end

    it 'call exit_command when exit' do
      allow(start_console).to receive(:input_scenario_command).and_return('exit')
      expect(start_console).to receive(:exit_command)
      start_console.run
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
      expect(start_console).to receive(:game_menu)
      start_console.run
    end
  end
end
