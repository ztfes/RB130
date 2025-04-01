# PROBLEM

# (rules)

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# EXAMPLE

# (C)
#   A
#  B B
# C   C
#  B B
#   A

# (D)
#    A
#   B B
#  C   C
# D     D
#  C   C
#   B B
#    A

# DSA

# (pattern)

# isosceles triangle (2 equal sides)
# height/width --> 2/3, 3/5, 4/7, 5/9, 6/11, 7/13
# base is widest
# each row above/below is 2 spaces "shorter"
# in (C) example, "C" row is 5 spaces, "B" is 3, "A", is 1

# (data structure)

# input is a string
# alphabet is probably an array of individual character stings
# diamond is probably formed using series of arrays
# output is probably the diamond array(s) printed to the screen

# (algo)

# Take input letter,  convert to uppercase
# initialize uppercase alphabet as an array
# find input letter index in alphabet
# find base of triangle
# letter_position * 2 - 1
# example --> "E" is 5th letter, base is 9 spaces wide
# 5 * 2 - 1 = 9

# (top_half)
# initialize empty array to collect line arrays final_array = []

# initialize array / line size is (C_position)*2 - 1 = 5 that is all empty spaces (' ')
# arr = [' ', ' ', ' ', ' ', ' '] == array.new(' ').5?

# iterate over array containing relevant letters from alphabet

# x = input_letter_position - current_letter_position

# placement = first index + x, final index - x

# IF "A" row...
# position = (size-1)/2
# arr[position] = "A"
# ELSE
# x = ...
# arr[0 + x], arr[-1 - x]

# (A) step through
# "A" -- IF
# position = 2
# arr[2] = "A"
# arr_A = [' ', ' ', 'A', ' ', ' ']
# final_array = [arr_A]
# "B" -- ELSE
# x = 1
# arr[0 + 1], arr[-1 - 1] = "B",
# arr_B = [' ', 'B', ' ', 'B', ' ']
# final_array = [arr_A, arr_B]
# "C" -- ELSIF
# x = 0
# arr[0 + 0], arr[-1 - 0] = "C",
# arr_B = ['C', ' ', ' ', ' ', 'C']
# final_array = [arr_A, arr_B, arr_C]

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    diamond_array = []
    diamond_string = ''

    diamond_letters(letter).each do |char|
      current_letter_position = ALPHABET.index(char) + 1
      arr = Array.new(line_size(letter), ' ')

      if char == 'A'
        position = (line_size(letter) - 1) / 2
        arr[position] = 'A'
      else
        position = input_position(letter) - current_letter_position
        arr[0 + position] = char  # left half
        arr[-1 - position] = char # right half
      end

      diamond_array << arr.join
    end

    diamond_array.each do |line|
      diamond_string += "#{line}\n"\
    end

    diamond_string
  end

  def self.diamond_letters(letter)
    top_half_letters = (ALPHABET[0]..letter).to_a
    bottom_half_letters = (ALPHABET[0]..ALPHABET[input_position(letter) - 2]).to_a.reverse
    top_half_letters + bottom_half_letters
  end

  def self.line_size(letter)
    input_letter_position = ALPHABET.index(letter) + 1
    (input_position(letter) * 2) - 1
  end

  def self.input_position(letter)
    ALPHABET.index(letter) + 1
  end
end
