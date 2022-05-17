# frozen_string_literal: true

module Lib
  class RegistrationConsole < Lib::CodebrakerConsole
    def run
      name = player_name
      difficulty = player_difficulty
      Lib::GameConsole.new(name, difficulty).run
    end

    private

    def player_name
      output_player_name_message
      player_name = check_input(input_player_name)
      output_greeting_message(player_name)
      player_name
    end

    def player_difficulty
      output_choose_difficulty_message
      difficulty = check_input(input_difficulty)
      output_difficulty_message(difficulty)
      difficulty
    end

    def check_input(input)
      input[:type] == :command ? send(:"#{input[:value]}_command") : input[:value]
    end
  end
end
