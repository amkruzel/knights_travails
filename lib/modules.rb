# necessary constant and method
module Pieces
  KNIGHT_MOVES = [-17, -15, -10, -6, 6, 10, 15, 17]

  def valid_square?(sqr)
    false unless sqr[0].between?(0, 7) && sqr[1].between?(0, 7)
    true
  end

  def coord_to_sqr(coords)
    coords[1] * 8 + coords[0]
  end
end
