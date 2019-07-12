class MyQueue
    def initialize
        @store = []
    end

    def enqueue(el)
        @store.push(el)
    end

    def dequeue
        @store.shift
    end

    def peek
        @store
    end
end


q = MyQueue.new

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

p q.peek
q.dequeue
p q.peek