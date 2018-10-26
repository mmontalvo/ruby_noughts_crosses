class Board
  class NotEmptyCoordinateError < StandardError; end

  OFFSET = 3
  GRID_SIZE = OFFSET**2
  EMPTY = ' '

  attr_reader :grid

  def initialize
    @grid = Array.new( [EMPTY] * GRID_SIZE )
  end

  def get_cell_by_position(position:)
    grid[position]
  end

  def set_cell(row:, column:, value:)
    raise NotEmptyCoordinateError if not_empty_cell?(row: row, column: column)
    grid[ (row * OFFSET) + column ] = value.downcase
  end

  def not_empty_cell?(row:, column:)
    grid[ (row * OFFSET) + column ] != EMPTY
  end

  def print
    "[#{grid[0]}, #{grid[1]}, #{grid[2]}]\n" +
    "[#{grid[3]}, #{grid[4]}, #{grid[5]}]\n" +
    "[#{grid[6]}, #{grid[7]}, #{grid[8]}]\n"
  end

  def full?
    grid.all?{ |cell| cell != EMPTY }
  end
end