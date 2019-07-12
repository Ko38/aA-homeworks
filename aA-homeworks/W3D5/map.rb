class MyMap

    def initialize
        @store = []
    end

    def get_index_of(key)
        idx = -1
        @store.each_with_index do |pair,i|
            if pair[0] == key
                idx = i
            end
        end
        idx
    end

    def set(key, value)
        idx = get_index_of(key)
        if idx != -1
            @store[idx][1] = value
        else
            @store << [key,value]
        end
    end

    def get(key)
        @store.select{ |a| a[0] == key}[0][1]
    end

    def delete(key)
        idx = get_index_of(key)
        if idx != -1
            @store.delete_at(idx)
        end
    end

    def show
        @store
    end
end

m = MyMap.new 

m.set("1","a")
p m.show
m.set("1","aa")
p m.show
m.set("2","b")
p m.show

p m.get("1")
p m.get("2")
m.delete("1")
p m.show