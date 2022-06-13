require '../W3D5/queue.rb'
require 'set'

class GraphNode 

    SEEN = Set.new 
    def initialize(value, neighbors=[])
        @value = value 
        @neighbors = neighbors
    end 

    def bfs(target)
        queue = Queue.new
        queue.enqueue(self)

        while !queue.empty?
            size = queue.size 
            
            for i in 0...size 
                root = queue.dequeue
                return root if root.value == target 
                root.children.each {|child| queue.enqueue(child)}
            end
        end
        nil 
    end 
end

