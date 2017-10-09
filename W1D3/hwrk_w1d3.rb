def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n += sum_to(n-1)
end

def add_numbers(nums_arr)
  return nums_arr[0] if nums_arr.length <= 1
  nums_arr[0] + add_numbers(nums_arr[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite
  flavors = flavors[1..-1]
  ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end

#puts sum_to(5)
#puts add_numbers([-80,34,7])
#puts gamma_fnc(8)
#puts reverse('atom')
#puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')
