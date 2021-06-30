class ChessBoard
  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
    @knight = "\u265E".encode('utf-8')
  end

  def valid_square?(sqr)
    false unless sqr[0].between?(0, 7) && sqr[1].between?(0, 7)
    true
  end
end

class Knight < ChessBoard

  def initialize
    super
  end

  def knight_moves(start_sqr, end_sqr)

  end
end
