# frozen_string_literal: true

module Modules
  module Errors
    class WrongApproveCommandError < StandardError
      WRONG_APPROVE_COMMAND_MESSAGE = 'Wrong command, please try again!'

      def initialize(msg = WRONG_APPROVE_COMMAND_MESSAGE)
        super
      end
    end
  end
end
