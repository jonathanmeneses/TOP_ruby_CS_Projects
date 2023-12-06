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
  attr_accessor :root
  def initialize(array)
    @root = self.build_tree(array)
  end
  def build_tree(array)
    sorted_array = array.uniq.sort
    sorted_array_to_bst(sorted_array)

  end

  def sorted_array_to_bst(arr)
    if arr.empty? then return nil end

    mid = arr.length / 2

    root = Node.new(arr[mid])
    root.left = sorted_array_to_bst(arr[0...mid])
    root.right = sorted_array_to_bst(arr[mid+1..])
    return root

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

def insert_number(num, node = self.root)
  return self.root = Node.new(num) unless node

  if num < node.data
    node.left.nil? ? node.left = Node.new(num) : insert_number(num,node.left)
  elsif num > node.data
    node.right.nil? ? node.right = Node.new(num) : insert_number(num,node.right)
  else
    raise "number already exists"
  end
end

def delete_number(num, node = self.root)
#SOLVE ME
end

end


array = [12,3,1,7,23,4,17,8]
tree = Tree.new(array)

tree.pretty_print

tree.insert_number(15)

tree.pretty_print
