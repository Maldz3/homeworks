#O(n^2)
def sluggish(array)
  longest_fish = array[0]
  length = array[0].length
  array.each_index do |i|
    array.each_index do |j|
      if array[j].length > array[i].length
        longest_fish = array[j]
        length = array[j].length
      end
    end
  end
  longest_fish
end

#O(n log(n))
def quicksort(array)
  return array if array.length < 2
  pivot = array[0]
  left = array[1..-1].select { |fish| fish.length < pivot.length }
  right = array[1..-1].select { |fish| fish.length > pivot.length }

  quicksort(left) + [pivot] + quicksort(right)
end

def dominant(fish_arr)
  quicksort(fish_arr)[-1]
end

#O(n)
def clever(array)
  longest_fish = 0
  length = 0
  array.each_index do |i|
    if array[i].length > length
      longest_fish = array[i]
      length = array[i].length
    end
  end
  longest_fish
end

#O(1)
def slow_dance(direction, array)
  array.each_with_index { |move, i| return i if move == direction }
end
hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
def constant_dance(direction, hsh)
  hsh[direction]
end

puts sluggish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
puts ''
puts clever(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
puts ''
puts dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
puts''
puts slow_dance('right-down', ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ])
puts ''
puts constant_dance('down', hash)
