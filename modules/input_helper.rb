# frozen_string_literal: true

module Modules
  module InputHelper
    include Modules::Validation
    include Modules::OutputHelper
    include Codebraker::Validation

    def input_player_name
      player_name = gets.chomp
      parse_input(player_name, :player_name, Modules::Constants::EXIT_COMMAND)
    rescue Codebraker::Errors::WrongNameError
      output_wrong_player_name_message
      output_player_name_message
      retry
    end

    def input_scenario_command
      scenario_command = gets.chomp
      scenario_command_validate!(scenario_command)
      scenario_command
    rescue Modules::Errors::WrongScenarioError
      output_wrong_scenario_message
      output_scenario_message(Modules::Constants::SCENARIO_COMMANDS.join(', '))
      retry
    end

    def input_difficulty
      difficulty = gets.chomp
      parse_input(difficulty, :difficulty, Modules::Constants::EXIT_COMMAND)
    rescue Codebraker::Errors::WrongDifficultyError
      output_wrong_difficulty_message
      output_choose_difficulty_message
      retry
    end

    def input_guess
      guess = gets.chomp
      parse_input(guess, :guess, Modules::Constants::GAME_COMMANDS)
    rescue Codebraker::Errors::InvalidGuessError
      output_wrong_guess_message
      output_guess_message
      retry
    end

    def input_approve_command
      approve_command = gets.chomp
      approve_command_validate!(approve_command)
      approve_command
    rescue Modules::Errors::WrongApproveCommandError
      output_wrong_command_message
      output_save_result_message(Modules::Constants::APPROVAL_COMMANDS.join('/'))
      retry
    end

    private

    def parse_input(input, input_type, command)
      case input
      when *command
        { type: :command, value: input }
      else
        public_send("#{input_type}_validate!", input)
        { type: :input, value: input }
      end
    end
  end
end
