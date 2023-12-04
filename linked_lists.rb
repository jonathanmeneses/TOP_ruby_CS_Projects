class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if self.head.nil?
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next_node = new_node
      self.tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value,self.head)
    self.head = new_node
  end

  def size
    counter = 0
    current_node = self.head
    while current_node
      counter+=1
      current_node = current_node.next_node
    end
    return counter
  end

  def at(index)

    if self.size-1 < index then raise "index out of range" end

      index_counter = 0
      current_node = self.head
      while index_counter < index
        current_node = current_node.next_node
        index_counter += 1
      end
      return current_node.value
  end

  def pop
    return nil if self.head.nil? # Handle case where list is empty

    if self.head == self.tail
      # If there's only one node in the list
      popped_value = self.head.value
      self.head = self.tail = nil
      return popped_value
    else
      # If there are multiple nodes
      current_node = self.head
      current_node = current_node.next_node while current_node.next_node != self.tail
      popped_value = self.tail.value
      self.tail = current_node
      self.tail.next_node = nil
      return popped_value
    end
  end

  def contains?(check_value)
    current_node = self.head
    while current_node
      return true if current_node.value == check_value
      current_node = current_node.next_node
    end
    false
  end

  def find(check_value)
    index_counter = 0
    current_node = self.head
    while current_node
      return index_counter if current_node.value == check_value
      current_node = current_node.next_node
      index_counter += 1
    end
    nil
  end

  def to_s
    current_node = self.head
    string_rep = ''
    while current_node
      string_rep += "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    string_rep+= 'nil'
    string_rep
  end

  def insert_at(value,index)
    if index > self.size then raise "index out of range" end

    if index == 0
      new_node = Node.new(value,self.head)
      self.head = new_node
    else

      index_counter = 0
      current_node = self.head
      while index_counter < index-1
        current_node = current_node.next_node
        index_counter += 1
      end

      pre_index = current_node
      post_index = current_node.next_node

      new_node = Node.new(value,post_index)
      pre_index.next_node = new_node
    end
    new_node
  end

end


class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

list = LinkedList.new
for number in 0..4
  list.append(number)
end
