# Anagrams
#
# Our goal today is to write a method that determines if two given
# words are anagrams. This means that the letters in one word can be
# rearranged to form the other word. For example:
#
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

# Assume that there is no whitespace or punctuation in the given strings.

# Phase I:
#
# Write a method #first_anagram? that will generate and store all the
# possible anagrams of the first string. Check if the second string is one of these.
#
# Hints:
#
# For testing your method, start with small input strings, otherwise you
# might wait a while. If you're having trouble generating the possible
# anagrams, look into this method. What is the time complexity of this solution?
#  What happens if you increase the size of the strings?
# TIME COMPLEXITY: O(n!)
def first_anagram?(string, target)
  letters = string.chars
  anagrams = letters.permutation.to_a #O(n!)

  anagrams.each do |anagram| #O(n)
    return true if anagram.join("") == target
  end
  false
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")
#
# Phase II:
#
# Write a method #second_anagram? that iterates over both strings. As you
 # find letters that appear in both words, delete them one at a time.
 # They are anagrams if both the strings are empty at the end.
#
# Try varying the length of the input strings. What are the differences
# between #first_anagram? and #second_anagram??
#
# TIME COMPLEXITY: O(n^2)
def second_anagram?(string, target)
  target_letters = target.chars

  target_letters.each do |letter| #O(n)
    string.delete!(letter) #O(n)
  end

  string.empty?
end

# p second_anagram?("gizmo", "sally") #false
# p second_anagram?("elvis", "lives") #true

# Phase III:
#
# Write a method #third_anagram? that solves the problem by sorting both
# strings alphabetically. The strings are then anagrams if and only if the
 # sorted versions are the identical.
#
# What is the time complexity of this solution? Is it better or worse
# than #second_anagram??
#
# TIME COMPLEXITY: nlogn (#sort method uses quicksort)
def third_anagram?(string, target)
  string_letters = string.chars
  target_letters = target.chars

  string_letters.sort == target_letters.sort
end

# p third_anagram?("gizmo", "sally") #false
# p third_anagram?("elvis", "lives") #true

# Phase IV:
#
# Write one more method #fourth_anagram?. This time, use two Hashes to
# store the number of times each letter appears in both words. Compare the resulting hashes.
#
# What is the time complexity?
#
# Bonus: Do it with only one hash.
#
# Discuss the time complexity of your solutions together, then call over your TA to look at them.

# TIME COMPLEXITY: O(N)
# SPACE COMPLEXITY: 0(N); HASHES AND STRINGS TAKE UP O(N)
def fourth_anagram?(string,target)
  letters_hash = Hash.new(0)

  string.chars.each do |letter| # O(N)
      letters_hash[letter] += 1 # O(1)
  end
  p letters_hash
  target.chars.each do |letter| # O(N)
    letters_hash[letter] -= 1 # O(1)
  end
  p letters_hash
  letters_hash.values.all?{|v| v == 0}
end

p fourth_anagram?("gizmo", "sally") #false
p fourth_anagram?("elvis", "lives") #true
