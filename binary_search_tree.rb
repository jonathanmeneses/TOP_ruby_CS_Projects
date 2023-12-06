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

def delete_number(num, node = self.root, parent = nil)
#SOLVE ME
#

# Is node a leaf?
#   Then just delete the node, and update the parent node
# If node has 1 child
#   the child now replaces the node as the child of the parent
# If the node has 2 children, find the "next biggest"
#   Do this by findind the very far left of the right subtree
#   Replace the deleted node with the found node
#     udpate the child nodes and parent

#traverse the tree to find the node

  return nil if node.nil?


  if num < node.data
    delete_number(num,node.left, node)
  elsif num > node.data
    delete_number(num,node.right, node)
  else

  # Leaf Node
  if node.left == nil && node.right == nil
    if parent.nil?
      self.root = nil
    elsif parent.left = node
      parent.left = nil
    else
      parent.right = nil
    end
  # 1 child node
  elsif node.left.nil? || node.right.nil?
    child = node.left.nil? ? node.right : node.left

    if parent.nil?
      self.root = child
    else
      parent.left == node ? parent.left = child : parent.right = child
    end
  # 2 child node
  elsif node.left && node.right
    successor_node = node.right
    successor_parent = node
    until search_node.left.nil?
      successor_parent = search_node
      successor_node = successor_node.left
    end

    node.data = successor_node.data

    if successor_parent == node
      successor_parent.right = successor_node.right
    else
      successor_parent.left = successor_node.right
    end

    end





end

def find(num, node = self.root)
  #traverse the tree to find the node

  if node.data == num
    return node
  else
    if num < node.data
      find(num,node.left)
    elsif num > node.data
      node(num,node.right)
    end
  end



end

end


array = [12,3,1,7,23,4,17,8]
tree = Tree.new(array)

tree.pretty_print

tree.insert_number(15)

tree.pretty_print
