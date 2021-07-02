require_relative 'data_struct'
require_relative 'modules'

def new_tree(start_sqr, board)
  MovesTree.new(start_sqr, board)
end

def find_moves(root, end_sqr)
  return 0 if root.coords == end_sqr
  return nil if root.nil?

  root.next_moves.each do |move|
    p move
    if find_moves(move, end_sqr)
      p move.coords
    end
  end

end

def knight_moves(start_sqr, end_sqr)
  tree = new_tree(start_sqr, board_ary)
  p tree.root

  find_moves(tree.root, end_sqr)
end

knight_moves([3, 3], [4, 3])
