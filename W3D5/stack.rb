class Stack
    def initialize
        @stack = []
    end

    def push(ele)
        @stack << ele
    end

    def pop
        raise "stack is empty" if @stack.length == 0
        @stack.pop
    end

    def peek
        raise "stack is empty" if @stack.length == 0
        @stack[-1]
    end
end

stack = Stack.new 
stack.push(1)
stack.push(2)
stack.push(3)