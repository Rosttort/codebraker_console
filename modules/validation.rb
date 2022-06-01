# frozen_string_literal: true

module Modules
  module Validation
    def scenario_command_validate!(command)
      raise Modules::Errors::WrongScenarioError unless Modules::Constants::SCENARIO_COMMANDS.value?(command)
    end

    def approve_command_validate!(command)
      raise Modules::Errors::WrongApproveCommandError unless Modules::Constants::APPROVAL_COMMANDS.value?(command)
    end
  end
end
