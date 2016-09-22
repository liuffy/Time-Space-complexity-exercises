# my_min
#
# Given a list of integers find the smallest number in the list.
#
# Example:
#
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
#
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# TIME COMPLEXITY : QUADRATIC ( O(n^2))
  def my_min(array)
    min_val = array.first
    array.each_with_index do |el1, idx1| # O(n)
      array.each_with_index do |el2, idx2| # O(n)
        if idx1 < idx2 # O(1)
          if el1 < el2# O(1)
            if el1 < min_val# O(1)
              min_val = el1# O(1)
            end
          else
            if el2 < min_val# O(1)
              min_val = el2# O(1)
            end
          end
        end
      end
    end
    min_val
  end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90])
#
# Phase II
#
# Now rewrite the function to iterate through the list just once while
# keeping track of the minimum. What is the time complexity?

# TIME COMPLEXITY: O(n)
  def better_min(array)
    min_val = array.first

    array.each do |el| #O(n)
      if el < min_val
        min_val = el
      end
    end
    min_val
  end
#
# p better_min([ 0, 3, 5, 4, -5, 10, 1, 90])
# Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find the largest contiguous
 # (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays
 # and return the max.
#
# Example:
#
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:
#
#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:
#
#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
#
# Write a function that iterates through the array and finds all sub-arrays
 # using nested loops. First make an array to hold all sub-arrays.
  # Then find the sums of each sub-array and return the max.
# Time Complexity: O(n^3)
def largest_contiguous_subsum(array)
  sums_list = []
  sums = []

  idx1 = 0

  while idx1 < array.length #O(n)
    idx2 = idx1 #O(1)
    while idx2 < array.length #O(n)
      sums_list << array[idx1..idx2] #O(n)
      idx2 += 1
    end
    idx1 += 1
  end

  sums_list.each do |list| #O(n)
    sums << list.reduce {|sum, num| sum + num} #O(n)
  end
  sums.max
end


# p  largest_contiguous_subsum(list)
# Discuss the time complexity of this solution.
#
# Phase II
#
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
# Keep a running tally of the largest sum.

# def better_sum(array)
#
#   array.combination(2).map{ |i,j| tokens[i...j].join " " }
# end

def better_subsum(array)
  biggest_sum = array.first
  sum = 0

  if array.all? {|el| el < 0}
    return array.max
  end

  array.each do |el|
    sum += el
    if sum < 0
      sum = 0
    end

    if biggest_sum < sum
      biggest_sum = sum
    end
  end
  biggest_sum
end
list1 = [2, 3, -6, 7, -6, 7] #8
list2 = [-5, -1, -3] # -1
list3 = [5, 3, -7] # 8

p better_subsum(list1)
p better_subsum(list2)
p better_subsum(list3)







# Get your story straight, and then explain your solution's time complexity to your TA.
