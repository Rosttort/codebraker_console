# frozen_string_literal: true

module Modules
  module OutputHelper
    def output_introduction_message
      puts I18n.t(:introduction_message)
    end

    def output_scenario_message(commands = Modules::Constants::SCENARIO_COMMANDS.values.join(', '))
      puts I18n.t(:select_scenario_message, commands: commands)
    end

    def output_wrong_scenario_message
      puts I18n.t(:wrong_scenario_message)
    end

    def output_rules_message
      puts I18n.t(:rules_message)
    end

    def output_player_name_message
      puts I18n.t(:player_name_message)
    end

    def output_wrong_player_name_message
      puts I18n.t(:wrong_player_name_message)
    end

    def output_greeting_message(player_name)
      puts I18n.t(:greeting_message, player_name: player_name)
    end

    def output_choose_difficulty_message
      puts I18n.t(:choose_difficulty_message)
    end

    def output_wrong_difficulty_message
      puts I18n.t(:wrong_difficulty_message)
    end

    def output_difficulty_message(difficulty)
      puts I18n.t(:"difficulties.#{difficulty}")
    end

    def output_guess_message
      puts I18n.t(:guess_input_message)
    end

    def output_wrong_guess_message
      puts I18n.t(:wrong_guess_input_message)
    end

    def output_guess_result_message(result)
      puts result
    end

    def output_hint_message(hint)
      puts I18n.t(:hint_message, hint: hint)
    end

    def output_no_hint_message
      puts I18n.t(:no_hint_message)
    end

    def output_wrong_command_message
      puts I18n.t(:wrong_command_message)
    end

    def output_win_message
      puts I18n.t(:win_message)
    end

    def output_lost_message
      puts I18n.t(:lose_message)
    end

    def output_answer_message(secret_code)
      puts I18n.t(:answer_message, secret_code: secret_code)
    end

    def output_save_result_message(command)
      puts I18n.t(:save_result_message, command: command)
    end

    def output_rating_message(rating_records)
      rating_message
      rating_header
      rating_records.each { |record| output_rating_records(record) }
    end

    def output_exit_game_message
      puts I18n.t(:exit_message)
    end

    private

    def rating_message
      puts I18n.t(:rating_message)
    end

    def rating_header
      puts I18n.t(:rating_data_header)
    end

    def output_rating_records(data)
      puts I18n.t(:rating_data_input, **data)
    end
  end
end
