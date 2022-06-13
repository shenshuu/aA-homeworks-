require 'set'
class GraphNode 

    SEEN = Set.new 
    def initialize(value, neighbors=[])
        @value = value 
        @neighbors = neighbors
    end 

    def bfs(src, target)

    end
end