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
      next_sqr_coords = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
      if valid_square?(next_sqr_coords)
        next_sqr = Square.new(next_sqr_coords)
        root.next_moves.push(Square.new(next_sqr))
        queue.push(next_sqr)
      end
    end

    queue
  end

  def build_tree(root, end_sqr)
    # make array of children from starting sqr
    queue = [].push(root)
    loop do
      new_root = Square.new(queue.shift.coords)
      break if new_root.coords == end_sqr

      queue = add_children(new_root, queue)
    end

    root
  end
end
