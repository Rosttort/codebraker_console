# frozen_string_literal: true

module Modules
  module Constants
    SCENARIO_COMMANDS = { start: 'start', rules: 'rules', rating: 'rating', exit: 'exit' }.freeze
    GAME_COMMANDS = { hint: 'hint', exit: 'exit' }.freeze
    EXIT_COMMAND = 'exit'
    APPROVAL_COMMANDS = { yes: 'yes', no: 'no' }.freeze
    AGREE_COMMAND = 'yes'
    DATA_FILE = File.join(__dir__, '../data/rating.yml').freeze
    DIFFICULTY_RATING = {
      easy: 3,
      medium: 2,
      hard: 1
    }.freeze
  end
end
