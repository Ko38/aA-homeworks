require_relative "PolyTreeNode"

class KnightPathFinder
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    attr_accessor :start_pos, :root_node, :considered_positions

    # def build_move_tree(node = nil)
    #     node = node == nil ? root_node : node
    #     pos = node.value
        
    #     new_move_positions(pos).each do |move|
    #         node.add_child(PolyTreeNode.new(move))
    #     end
        
    #     node.children.each do |child|
    #         # new_move_positions(child.value).each do |move|
    #         #     child.add_child(PolyTreeNode.new(move))
    #         # end
    #         build_move_tree(child)
    #     end
        
        
    #     # until new_move_positions.empty?
    #     #     node.add_child(PolyTreeNode.new(new_move_positions.first))
    #     #     new_move_positions += new_move_positions(new_move_positions.first)
    #     # end
    # end

    def build_move_tree(node = self.root_node)
        nmp = new_move_positions(node.position)
        return nil if nmp == []
        nmp.each do |next_position|
            np = PolyTreeNode.new(next_position)
            np.parent = node
            build_move_tree(np)
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

    def printer
        
    end

end
