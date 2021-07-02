# necessary constant and method
module Pieces
  KNIGHT_MOVES = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ]

  def valid_square?(sqr)
    false unless sqr[0].between?(0, 7) && sqr[1].between?(0, 7)
    true
  end
end
