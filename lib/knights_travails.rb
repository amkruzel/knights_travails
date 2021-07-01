require_relative 'data_struct'
require_relative 'modules'

# makes board arr and valid squares method
class ChessBoard
  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
  end
end

class Knight

  def knight_moves(start_sqr, end_sqr)
    moves_tree = MovesTree.new(Square.new(start_sqr), end_sqr)

    moves_tree
  end
end