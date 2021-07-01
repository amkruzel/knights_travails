require_relative 'modules'

# 'node' in this data structure
class Square
  attr_accessor :next_moves
  attr_reader :coords

  def initialize(coords)
    @coords = coords
    @next_moves = []
  end
end

# 'tree' to hold Squares
class MovesTree
  include Pieces

  attr_reader :root

  def initialize(start_sqr, end_sqr)
    @root = build_tree(start_sqr, end_sqr)
  end

  def add_children(root, queue)
    8.times do |n|
      # checking if next square is not off the board
      next_sqr = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
      root.next_moves.push(Square.new(next_sqr)) if valid_square?(next_sqr)
    end
  end

  def build_tree(root, end_sqr)
    # make array of children from starting sqr
    queue = [].push(root)
    loop do
      new_root = queue.shift
      add_children(new_root, queue)

      break if new_root.next_moves.include?(end_sqr)
    end

    root
  end
end
