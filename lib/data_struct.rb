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

  def initialize(start_sqr)
    @root = start_sqr
    @board_ary = Array.new(8) { Array.new(8, 0) }
    build_tree(start_sqr)
  end

  def build_tree(root, next_coords = [])
    root = Square.new(start_sqr)

    loop do
      @board_ary[root.coords[0]][root.coords[1]] = 1

      8.times do |n|
        # make array of valid next squares, called next_coords
        next_sqr_coords = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
        if valid_square?(next_sqr_coords) && @board_ary[next_sqr_coords[0]][next_sqr_coords[0]].zero?
          next_coords.push(next_sqr_coords)
        end
      end

      root.next_moves.push()
    end
      
  end

  # def add_children(root, queue)
  #   8.times do |n|
  #     # checking if next square is not off the board
  #     next_sqr_coords = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
  #     if valid_square?(next_sqr_coords)
  #       next_sqr = Square.new(next_sqr_coords)
  #       root.next_moves.push(Square.new(next_sqr))
  #       queue.push(next_sqr)
  #     end
  #   end

  #   queue
  # end

  # def build_tree(start_sqr, end_sqr)
  #   # make array of children from starting sqr
  #   queue = [].push(start_sqr)
  #   root = Square.new(start_sqr)

  #   loop do
  #     new_root = Square.new(queue.shift.coords)
  #     break if new_root.coords == end_sqr

  #     queue = 8.times do |n|
  #       # checking if next square is not off the board
  #       next_sqr_coords = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
  #       if valid_square?(next_sqr_coords)
  #         next_sqr = Square.new(next_sqr_coords)
  #         root.next_moves.push(Square.new(next_sqr))
  #         queue.push(next_sqr)
  #       end
  #     end
  
  #     queue
  #   end

  #   root
  # end

  # def build_tree(start_sqr, end_sqr)
  #   return nil if start_sqr == end_sqr

  #   root = Square.new(start_sqr)

  #   ary = []
  #   8.times do |n|
  #     # checking if next square is not off the board
  #     next_sqr_coords = [root.coords[0] + KNIGHT_MOVES[n - 1][0], root.coords[1] + KNIGHT_MOVES[n - 1][1]]
  #     ary.push(next_sqr_coords) if valid_square?(next_sqr_coords)
  #     end
  #   end

  #   root.next_moves.push(build_tree())
end
