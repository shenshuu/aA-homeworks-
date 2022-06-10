class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |pairs|
            if pairs[0] == key 
                pairs[1] = value
                return 
            end 
        end
        @map << [key, value]
    end 

    def get(key)
        @map.each {|pairs| return pairs[1] if pairs[0] == key}
    end

    def delete(key)
        @map.each_with_index {|pairs, i| @map.delete_at(i) if pairs[0] == key}
    end

    def show
        p @map 
    end 
end