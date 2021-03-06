require_relative 'data_struct'
require_relative 'modules'

include Pieces

def knight_moves(start_coord, end_coord)
  start_sqr = coord_to_sqr(start_coord)
  end_sqr = coord_to_sqr(end_coord)
  tree = MovesTree.new(start_sqr)

  tree.find_path(end_sqr)
end


knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])

knight_moves([3,3],[4,3])
