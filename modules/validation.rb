# frozen_string_literal: true

module Modules
  module Validation
    def scenario_command_validate!(command)
      raise Modules::Errors::WrongScenarioError unless Modules::Constants::SCENARIO_COMMANDS.values.include?(command)
    end

    def approve_command_validate!(command)
      raise Modules::Errors::WrongApproveCommandError unless Modules::Constants::APPROVAL_COMMANDS.values.include?(command)
    end
  end
end
