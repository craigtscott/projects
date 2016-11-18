require 'byebug'

# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  out = []
  (1..num).each do |el|
    if num % el == 0
      out << el
    end
  end
  out
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new  { |x,y| x <=> y }
    sorted = false
    until sorted
      sorted = true
      self.each_index do |first|
        second = first + 1 unless first == -1
          if prc.call(self[first],self[second]) == 1
            self[first],self[second] = self[second],self[first]
            sorted = false
          end
      end
    end
    p self
  end

  def bubble_sort(&prc)
    new_array = self.dup
    new_array.bubble_sort!(&prc)
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  out = []
  0.upto(string.length - 1) do |first_idx|
    first_idx.upto(string.length - 1) do |second_idx|
      out << string[first_idx..second_idx]
    end
  end
  out
end

def subwords(word, dictionary)
  strings = substrings(word)
  words = strings.keep_if {|el| dictionary.include?(el)}
  words
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array

  def my_each(&prc)
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
  end

  def my_select(&prc)
  end

  def my_inject(&blk)
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
end

class Array
  def my_each(&prc)
    # debugger
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    return self
  end

  def my_select(&prc)
    idx = 0
    out = []
    while idx < self.length
      out << self[idx] if prc.call(self[idx]) == true
      idx += 1
    end
    out
  end

  def my_reject(&prc)
    idx = 0
    out = []
    while idx < self.length
      out << self[idx] if prc.call(self[idx]) == false
      idx += 1
    end
    out
  end

  def my_any?(&prc)
    idx = 0
    while idx < self.length
      return true if prc.call(self[idx]) == true
      idx += 1
    end
    false
  end

  def my_all?(&prc)
    idx = 0
    while idx < self.length
      return false if prc.call(self[idx]) == false
      idx += 1
    end
    true
  end

  def my_flatten
    # debugger
    out = []
    arr = self
    arr.each do |el|
      if el.class == Array
        out += el.my_flatten
      else
        out << el
      end
    end
    out
  end

  def my_zip(*arrays)
    # debugger
    out_array = []
    self.each_with_index do |el, idx|
      out_array << [el]
      arrays.each do |array|
        out_array[idx] << array[idx]
      end
    end

    out_array
  end

  def my_rotate(input = 1)
    # debugger
    input = self.length + input if input < 0
    output = self
    input.times do |el|
      output = output[1..-1] << output[0]
    end
    output
  end
  def my_join(sep = "")
    output = ""
    self.each {|el| output += el + sep}
    if sep != ""
      output.slice!(0...-1)
    else
      output
    end
  end

  def my_reverse
    out = []
    arr = self
    until arr.empty?
      out << arr.last
      arr.slice!(-1)
    end
    out
  end


end
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)


# a = [1, 2, 3]
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 }
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# return_value = [1, 2, 3].my_each do |num|
#    puts num
#  end.my_each do |num|
#    puts num
#  end
#
#  p return_value
