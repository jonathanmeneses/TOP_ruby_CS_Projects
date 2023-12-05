class Node
  include Comparable
  attr_accessor :data, :left, :right
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  def initialize(array)
    @root = self.build_tree(array)
  end
  def build_tree(array)
    sorted_array = array.uniq.sort

  end

  def sortedArraytoBST(arr)

  end
end
