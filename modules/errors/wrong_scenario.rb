# frozen_string_literal: true

module Modules
  module Errors
    class WrongScenarioError < StandardError
      WRONG_SCENARIO_MESSAGE = 'Wrong command! Please choose the command from following!'

      def initialize(msg = WRONG_SCENARIO_MESSAGE)
        super
      end
    end
  end
end
