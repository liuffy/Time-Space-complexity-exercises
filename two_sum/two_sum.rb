def bad_two_sum?(arr,target_sum)
  arr.each_with_index do |el1,idx1|
    arr.each_with_index do |el2,idx2|
      if idx1 < idx2
        return true if el1 + el2 == target_sum
      end
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)

  arr.sort!.each_with_index do |el, idx|
    #use ifs instead of index search
    if target_sum.to_f / 2 == el #if even
      return true if el == arr[idx+1]
    else
      return true if arr.bsearch {|x| x == target_sum - el}
    end
  end
  false
end
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10)

# def sort_sum(arr, target_sum)
#   arr.sort!
#   arr.take_while {|el| el <= target_sum}
# end

def two_sum?(arr, target_sum)
# hash with all the array elements as keys, and the value is the target_sum
# key - value -
  diffs = Hash.new

  arr.each do |el|
    diffs[el] = target_sum - el
  end
  # { 0 => 6, 1 => 5, 5 => 1, 7 => -1 }
  return true if (diffs.keys - diffs.values).size % 2 == 0 &&
  (diffs.keys - diffs.values).size != 0
  false
end

 arr = [0, 1, 5, 7, 5]
 arr2 = [0,3,4,2]
 p okay_two_sum?(arr, 6) # => should be true
 p okay_two_sum?(arr, 10)
 p okay_two_sum?(arr2, 8)
