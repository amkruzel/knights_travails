# necessary constant and method
module Pieces
  KNIGHT_MOVES = [-17, -15, -10, -6, 6, 10, 15, 17]

  def valid_square?(coords)
    false unless coords[0].between?(0, 7) && coords[1].between?(0, 7)
    true
  end

  def coord_to_sqr(coords)
    coords[1] * 8 + coords[0]
  end

  def sqr_to_coord(sqr)
    [sqr % 8, sqr / 8]
  end
end
