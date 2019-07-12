
class Stack
    def initialize
        @store = []
        # create ivar to store stack here!
    end

    def push(el)
        @store.push(el)
    end

    def pop
        @store.pop
    end

    def peek
        @store.last
    end
end 



s = Stack.new 
s.push(1)
s.push(2)
p s.peek
s.pop
p s.peek