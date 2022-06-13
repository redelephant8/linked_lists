require "pry"

class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        elsif @head.next_node.nil?
            @head.next_node = new_node
            @tail = new_node
        else
            @tail.next_node = new_node
            @tail = new_node
        end
    end

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    def size()
        counter = 1
        if @head.nil?
            return 0
        end
        current = @head
        until current.next_node.nil?
            counter += 1
            current = current.next_node
        end
        return counter
    end

    def head
        if @head.nil?
            return 
        else
            return @head.value
        end
    end

    def tail
        if @tail.nil?
            return
        else
            return @tail.value
        end
    end

    def at(index)
        if index + 1 <= size
            counter = 0
            current = @head
            while current != @tail
                if index == counter
                    return current
                end
                current = current.next_node
                counter += 1
            end
        end
    end

    def pop
        if @tail.nil?
            return
        end 
            temp = at(size - 2)
            temp.next_node = nil
            @tail = at(size - 1)
            if @tail == @head
                @tail = nil
            end
    end

    def contains?(value)
        current = @head
        index = 0
        while size != index
            if current.value == value
                return true
            end
            current = current.next_node
            index += 1
        end
        return false
    end

    def find(value)
        index = 0
        current = @head
        while index + 1 <= size
            if current.value == value
                return index
            end
            current = current.next_node
            index += 1
        end
        return 'nil'
    end

    def to_s
        current = @head
        index = 0
        while index + 1 <= size
            print "( #{current.value} ) -> "
            current = current.next_node
            index += 1
        end
        print "nil"
        puts ""
    end

    def insert_at(value, idx)
        return if idx + 1 > size
        index = 0
        current = @head
        while index + 1 <= size
            if index == idx - 1
                current.next_node = Node.new(value, current.next_node)
            end
            index += 1
            current = current.next_node
        end
    end

    def remove_at(index)
        return if index + 1 > size
        temp = at(index - 1)
        temp.next_node = at(index -1).next_node.next_node
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end


