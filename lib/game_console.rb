# frozen_string_literal: true

module Lib
  class GameConsole < Lib::CodebrakerConsole
    attr_accessor :game

    def initialize(player_name, difficulty)
      @game = Codebraker::Game.new(player_name, difficulty.to_sym)
      super()
    end

    def run
      output_guess_message
      input = input_guess
      case input[:type]
      when :command then send("#{input[:value]}_command")
      when :input
        guess = game.check_guess(input[:value])
        show_result(guess)
      end
    end

    def show_result(guess)
      result = guess[:answer]
      output_guess_result_message(result)
      check_status(guess)
    end

    private

    def hint_command
      hint = game.give_hint
    rescue Codebraker::Errors::HintError
      output_no_hint_message
    else
      output_hint_message(hint)
      run
    end

    def check_status(guess)
      case guess[:status]
      when :win
        win(guess)
        save_result
      when :lost then lost(guess)
      else run
      end
    end

    def win(guess_code)
      output_win_message
      give_answer(guess_code[:code])
    end

    def lost(guess_code)
      output_lost_message
      give_answer(guess_code[:code])
    end

    def give_answer(code)
      output_answer_message(code)
    end

    def save_result
      output_save_result_message(Modules::Constants::APPROVAL_COMMANDS.values.join('/'))
      command = input_approve_command
      Lib::RatingConsole.add_data(game.to_h) if command == Modules::Constants::AGREE_COMMAND
    end
  end
end
