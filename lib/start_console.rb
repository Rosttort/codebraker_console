# frozen_string_literal: true

module Lib
  class StartConsole < Lib::CodebrakerConsole
    def run
      output_introduction_message
      game_menu
    end

    def game_menu
      output_scenario_message(Modules::Constants::SCENARIO_COMMANDS.join(', '))
      scenario = input_scenario_command
      send("#{scenario}_command")
    end

    private

    def start_command
      Lib::RegistrationConsole.new.run
      game_menu
    end

    def rules_command
      output_rules_message
      game_menu
    end

    def rating_command
      output_rating_message(Lib::RatingConsole.records)
      game_menu
    end
  end
end
