def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    return n + sum_to(n-1)
end

def add_number(nums)
    return nil if nums.length == 0
    return nums[0] if nums.length == 1
    return nums[0] + add_number(nums[1..-1])
end

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n <= 2
    return (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return flavors.first == favorite || ice_cream_shop(flavors[1..-1], favorite)
end 

def reverse(string)
    return "" if string.length == 0
    return string[-1] + reverse(string.chop)
end