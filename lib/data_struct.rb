require_relative 'modules'

# 'node' in this data structure
class Square
  attr_accessor :next_sqrs, :parent_sqr
  attr_reader :sqr

  def initialize(sqr)
    @sqr = sqr
    @next_sqrs = []
  end
end

# 'tree' to hold Squares
class MovesTree
  include Pieces

  attr_reader :root

  def initialize(start_sqr)
    @board_ary = Array.new(64) { |n| n }
    @root = build_tree(start_sqr)
  end

  def build_tree(sqr, cnt = 0)
    return nil unless cnt < 8 && sqr.between?(0, 63)

    root = Square.new(sqr)
    ary_sqrs = make_next_sqrs_ary(sqr)
    ary_sqrs.each do |next_sqr|
      next_root = build_tree(next_sqr, cnt + 1)
      root.next_sqrs.push(next_root)
      next_root.parent_sqr = root unless root.nil? || next_root.nil?
    end

    root
  end

  # helper function for build_tree
  def make_next_sqrs_ary(sqr)
    ary = []
    8.times do |n|
      next_sqr = sqr + KNIGHT_MOVES[n - 1]
      ary.push(next_sqr) if next_sqr.between?(0, 63)
    end
    ary
  end

  def find_path(end_sqr, path = [])
    queue = [].push(root)

    sqr_to_find = 0

    loop do
      cur_sqr = queue.shift
      cur_sqr.next_sqrs.each { |s| queue.push(s) }
      # queue.push(cur_sqr.next_sqrs)
      if cur_sqr.sqr == end_sqr
        sqr_to_find = cur_sqr
        break
      end
    end

    loop do
      path.prepend(sqr_to_coord(sqr_to_find.sqr))
      break if sqr_to_find.parent_sqr == root

      sqr_to_find = sqr_to_find.parent_sqr
    end

    puts "You made it in #{path.size} moves! Here's your path:"
    p sqr_to_coord(root.sqr)
    path.each { |item| p item }
  end
end
