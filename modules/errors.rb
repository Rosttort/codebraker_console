# frozen_string_literal: true

module Errors
  class WrongScenarioError < StandardError
    WRONG_SCENARIO_MESSAGE = 'Wrong command! Please choose the command from following!'
    def initialize(msg = WRONG_SCENARIO_MESSAGE)
      super
    end
  end

  class WrongApproveCommandError < StandardError
    WRONG_APPROVE_COMMAND_MESSAGE = 'Wrong command, please try again!'
    def initialize(msg = WRONG_APPROVE_COMMAND_MESSAGE)
      super
    end
  end
end
