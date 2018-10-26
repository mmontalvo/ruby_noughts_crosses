require_relative 'board'

class Game
  class NotYourTurnError < StandardError; end
  class BoardFullError < StandardError; end
  class Winner < StandardError; end

  NOUGHTS_AND_CROSSES = {
    nought: 'o',
    cross:  'x'
  }

  WINNER_COMBINATIONS =
    # rows
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    # columns
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    # diagonals
    [0, 4, 8], [2, 4, 6]
  
  attr_accessor :current_player, :other_player, :board, :winner

  def initialize
    @board = Board.new
    @winner = nil
    @current_player, @other_player = NOUGHTS_AND_CROSSES.values.shuffle
  end

  def make_move(row:, column:, value:)
    run_checks(row: row, column: column, value: value)
    board.set_cell(row: row, column: column, value: value)
    check_for_winner
  end

  def print_board
    board.print
  end

  private

  def run_checks(row:, column:, value:)
    raise Winner           if winner
    raise BoardFullError   if board.full?
    raise NotYourTurnError if value.downcase != current_player
  end

  def check_for_winner
    if winner?
      @winner = current_player
      print_board + "WINNER #{@winner}!"
    else
      switch_players
      print_board
    end
  end

  def winner?
    WINNER_COMBINATIONS.any?{ |combination|
      [
        board.get_cell_by_position(position: combination[0]),
        board.get_cell_by_position(position: combination[1]),
        board.get_cell_by_position(position: combination[2])
      ].all?{ |element| element == current_player }
    }
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end  
end
