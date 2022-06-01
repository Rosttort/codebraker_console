# frozen_string_literal: true

module Lib
  class CodebrakerConsole
    include Modules::OutputHelper
    include Modules::InputHelper

    def exit_command
      output_exit_game_message
      exit
    end
  end
end
