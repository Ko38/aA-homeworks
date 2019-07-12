class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) if !@parent.nil?
        @parent = node
        return if node == nil
        if !node.children.include?(self)
            node.children << self
        end
    end
    
    def add_child(node)
        node.parent = self
       # @children << node
    end

    def remove_child(node)
        if node.parent != self
            raise "error"
        end
        node.parent = nil
    end

    def dfs(target)
        return self if target == self.value

        self.children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target)
        #return self if target == self.value

        queue = [self]

        until queue.empty?
            return queue.first if queue.first.value == target

            queue += queue.first.children
            queue.shift
        end
        nil
    end
end

