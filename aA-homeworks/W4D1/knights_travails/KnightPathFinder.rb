require_relative "PolyTreeNode"
require "tree_support"

class KnightPathFinder
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    attr_accessor :start_pos, :root_node, :considered_positions

    # def build_move_tree(node = self.root_node)
    #     nmp = new_move_positions(node.position)
    #     return nil if nmp == []
    #     nmp.each do |next_position|
    #         np = PolyTreeNode.new(next_position)
    #         np.parent = node
    #         build_move_tree(np)
    #     end
    # end

    def build_move_tree(node = self.root_node)
        node_order = [node]
        until node_order.empty?
            nmp = new_move_positions(node_order.first.position)
            nmp.each do |next_move|
                next_position = PolyTreeNode.new(next_move)
                next_position.parent = node_order.first
                node_order << next_position
            end
            node_order.shift
        end
    end

    def self.valid_moves(pos)
        possible = [[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]
        valid_moves = []
        possible.each do |move|
            x = pos[0] + move[0]
            y = pos[-1] + move[-1]
            if x >= 0 && y >= 0 && x <= 7 && y <=7
                valid_moves << [x,y]
            end
        end
        valid_moves
    end

    def new_move_positions(pos)
        vms = KnightPathFinder.valid_moves(pos)
        new_moves = []
        vms.each do |move|
            new_moves << move if !self.considered_positions.include?(move)
        end
        self.considered_positions += new_moves
        new_moves
    end

    def find_path(target)
        node = self.root_node.bfs(target)
        trace_path_back(node)
    end

    def trace_path_back(node)
        path = Array.new
        until node.parent == nil
            path << node.value
            node = node.parent
        end
        path.reverse.unshift(self.root_node.value)
    end

end

kpf = KnightPathFinder.new([0,0])


puts TreeSupport.tree(kpf.root_node)
# k.find_path([3,3])