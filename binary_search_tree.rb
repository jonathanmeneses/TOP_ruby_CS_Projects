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
  end

  def find_in_tree(num, node = self.root)
    return nil if node.nil?

    if node.data == num
      return node
    elsif num < node.data
      find_in_tree(num, node.left)
    else
      find_in_tree(num, node.right)
    end
  end

  def level_order(node = self.root)
    return [] if node.nil?
    queue = [node]
    return_array = []
    until queue.empty?
      process_node = queue.shift
      if block_given?
        yield process_node.data
      else
        return_array << process_node.data
      end
      queue << process_node.left if process_node.left
      queue << process_node.right if process_node.right
    end

    return_array unless block_given?

  end


  def inorder(node = self.root, return_array = [], &block)
    return if node.nil?

    inorder(node.left, return_array, &block)
    if block_given?
      yield node.data
    else
      return_array << node.data
    end
    inorder(node.right, return_array, &block)

    if !block_given?
      return_array
    end

  end

  def preorder(node = self.root, return_array = [], &block)
    return if node.nil?

    if block_given?
      yield node.data
    else
      return_array << node.data
    end
    preorder(node.left, return_array, &block)
    preorder(node.right, return_array, &block)

    if !block_given?
      return_array
    end

  end

  def postorder(node = self.root, return_array = [], &block)
    return if node.nil?


    postorder(node.left, return_array, &block)
    postorder(node.right, return_array, &block)
    if block_given?
      yield node.data
    else
      return_array << node.data
    end

    if !block_given?
      return_array
    end

  end




  def height(node = self.root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1

  end

  def depth(node, root = self.root)
    counter = 0
    if node.nil?
      return -1
    elsif
    end
  end

  private



end



array = [12,3,1,7,23,4,17,8]
tree = Tree.new(array)

tree.pretty_print

tree.insert_number(15)


p tree.height()

tree.inorder {|n| puts n*2}
p "/n /n \n new lines"
p tree.preorder
p tree.postorder
