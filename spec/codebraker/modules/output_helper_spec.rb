# frozen_string_literal: true

RSpec.describe Modules::OutputHelper do
  subject(:dummy) { Class.new { include Modules::OutputHelper }.new }

  describe '#introduction' do
    it 'show introduction message' do
      expect { dummy.output_introduction_message }.to output { I18n.t(:introduction_message) }.to_stdout
    end
  end

  describe '#scenario' do
    it 'show scenario message' do
      expect { dummy.output_scenario_message('%{commands}') }.to output { I18n.t(:select_scenario_message) }.to_stdout
    end
  end

  describe '#wrong_scenario' do
    it 'show wrong scenario message' do
      expect { dummy.output_wrong_scenario_message }.to output { I18n.t(:wrong_scenario_message) }.to_stdout
    end
  end

  describe '#rules' do
    it 'show rules message' do
      expect { dummy.output_rules_message }.to output { I18n.t(:rules_message) }.to_stdout
    end
  end

  describe '#player_name' do
    it 'show player name message' do
      expect { dummy.output_player_name_message }.to output { I18n.t(:player_name_message) }.to_stdout
    end
  end

  describe '#wrong_player_name' do
    it 'show wrong player name message' do
      expect { dummy.output_wrong_player_name_message }.to output { I18n.t(:wrong_player_name_message) }.to_stdout
    end
  end

  describe '#greeting' do
    let(:player_name) { 'player' }

    it 'show greeting message' do
      expect { dummy.output_greeting_message(player_name) }.to output { I18n.t(:greeting_message) }.to_stdout
    end
  end

  describe '#choose_difficulty' do
    it 'show choose difficulty message' do
      expect { dummy.output_choose_difficulty_message }.to output { I18n.t(:choose_difficulty_message) }.to_stdout
    end
  end

  describe '#wrong_difficulty' do
    it 'show wrong difficulty message' do
      expect { dummy.output_wrong_difficulty_message }.to output { I18n.t(:wrong_difficulty_message) }.to_stdout
    end
  end

  describe '#wrong_command' do
    it 'show wrong command message' do
      expect { dummy.output_wrong_command_message }.to output { I18n.t(:wrong_command_message) }.to_stdout
    end
  end

  describe '#wrong_guess_input' do
    it 'show message' do
      expect { dummy.output_guess_message }.to output { I18n.t(:guess_input_message) }.to_stdout
    end
  end

  describe '#guess_input' do
    it 'show message' do
      expect { dummy.output_wrong_guess_message }.to output { I18n.t(:wrong_guess_input_message) }.to_stdout
    end
  end

  describe '#hint' do
    let(:hint) { rand(1..6) }

    it 'show hint' do
      expect { dummy.output_hint_message(hint) }.to output { I18n.t(:hint_message) }.to_stdout
    end
  end

  describe '#no_hint' do
    it 'show no hint message' do
      expect { dummy.output_no_hint_message }.to output { I18n.t(:no_hint_message) }.to_stdout
    end
  end

  describe '#win' do
    it 'show win message' do
      expect { dummy.output_win_message }.to output { I18n.t(:win_message) }.to_stdout
    end
  end

  describe '#lost' do
    it 'show message' do
      expect { dummy.output_lost_message }.to output { I18n.t(:lose_message) }.to_stdout
    end
  end

  describe '#answer' do
    let(:secret_code) { '1234' }

    it 'show message' do
      expect { dummy.output_answer_message(secret_code) }.to output { I18n.t(:answer) }.to_stdout
    end
  end

  describe '#exit' do
    it 'show exit message' do
      expect { dummy.output_exit_game_message }.to output { I18n.t(:exit_message) }.to_stdout
    end
  end

  describe '#guess_result' do
    let(:result) { "+-\n" }

    it 'shows check result' do
      expect { dummy.output_guess_result_message(result.chomp) }.to output(result).to_stdout
    end
  end

  describe '#rating' do
    let(:message) { "Codebreaker rating\n" }
    let(:data_header) { "Rating | Name | Difficulty | Attempts Total | Attempts Left | Hints | Hints left\n" }
    let(:data_input) { "1 | Rost | easy | 15 | 10 | 2 | 2\n" }
    let(:data) { File.join('spec', 'dp', 'rating.yml') }
    let(:rating) { message + data_header + data_input }
    let(:data_load) { YAML.load_stream(File.read(data)).map { |record| record } || [] }
    let(:expected_result) { data_load.map.with_index { |record, index| { rating: index + 1 }.merge(record) } }

    it 'shows message from config :rating_message, :rating_data_header, :rating_data_input' do
      expect { dummy.output_rating_message(expected_result) }.to output(rating).to_stdout
    end
  end
end
