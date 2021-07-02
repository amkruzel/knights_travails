require_relative 'modules'

# 'node' in this data structure
class Square
  attr_accessor :left17, :left15, :left10, :left6, :right17, :right15, :right10, :right6
  attr_reader :sqr

  def initialize(sqr)
    @sqr = sqr
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

  def build_tree(sqr, ary = @board_ary)
    return nil unless ary.include?(sqr)

    @board_ary.delete(sqr)

    root = Square.new(sqr)
    root.left17 = build_tree(sqr - 17)
    root.left15 = build_tree(sqr - 15)
    root.left10 = build_tree(sqr - 10)
    root.left6 = build_tree(sqr - 6)
    root.right17 = build_tree(sqr + 17)
    root.right15 = build_tree(sqr + 15)
    root.right10 = build_tree(sqr + 10)
    root.right6 = build_tree(sqr + 6)

    root
  end

  # def find_path(cur_sqr, end_sqr, path = [])
  #   board = Array.new(64) { |n| n }

  #   loop do
  #     if end_sqr < sta
  #   end
  # end
end
