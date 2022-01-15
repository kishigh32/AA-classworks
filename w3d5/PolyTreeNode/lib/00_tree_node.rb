class PolyTreeNode

  attr_reader :parent, :children, :value

    def initialize(value)
      @parent = nil
      @children = []
      @value = value
    end

    def parent=(parent_node)
      @parent.children.delete(self) if !@parent.nil?

      if parent_node.nil?
        @parent = parent_node
        return
      end
      @parent = parent_node
      @parent.children << self if !@parent.children.include?(self)
    end

    def add_child(child_node) 
      child_node.parent = self
    end

    def remove_child(child_node)
      child_node.parent = nil   
      raise if !self.nil? && !self.children.include?(child_node)
    end

    def bfs(target_value)
      arr = []
      arr.unshift(self) #enqueue = shift

      until arr.empty?
        first_value = arr.pop #dequeue = pop
        return first_value if first_value.value == target_value

        first_value.children.each do |child|
          arr.unshift(child)
        end
      end

      nil
    end


    def dfs(target_value)
      return self if self.value == target_value
      self.children.each do |child|
        search = child.dfs(target_value)
        return search if !search.nil?
      end
      nil
    end
end



