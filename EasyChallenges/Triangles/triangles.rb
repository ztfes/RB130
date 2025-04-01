# PROBLEM

  # (rules)

    # To be a valid triangle, each side length must be greater than 0.
    # To be a valid triangle, the sum of the lengths of any two sides must be greater than the length of the remaining side.
    # An equilateral triangle has three sides of equal length.
    # An isosceles triangle has exactly two sides of the equal length.
    # A scalene triangle has three sides of unequal length (no two sides have equal length).

  # (requirements --> methods)

    # Need to verify valid inputs for sides a, b, c
    # verify all side lengths are > 0
    # verify sum of a + b > c, a + c > b, and b + c > a
    # equilateral case: verify a == b == c
    # isoscles case: verify a == b || a == c || b = c
    # scalene case: verify a != b != c

# EXAMPLE

  # (valid triangle, isosceles)

    # a = 2, b = 2, c = 3

    # valid_triangle? --> TRUE
      # a + b > c, a + c > b, b + c > a
      # no sides <= 0
    # isosceles? --> TRUE
      # a == b

  # (invalid triangle)

    # a = 0, b = 1, c = 2
    # valid_triangle? --> FALSE
      # "All sides must be > 0"

# ALGO

  # instantiate Triangle object
  # verify triangle validity
  # verify triangle classification

class Triangle

  attr_reader :side_a, :side_b, :side_c, :type

  def initialize(a,b,c)
    @side_a = a
    @side_b = b
    @side_c = c
    @type = nil
  end

  def side_length_verification;
    # return true if requirement met
    if (side_a > 0) & (side_b > 0) & (side_c > 0)
      true
    else
      puts "All sides must be > 0"
      false
    end
  end

  def two_side_sum_verification;
    # return true if requirement met
    if (side_a + side_b > side_c) & (side_b + side_c > side_a) & (side_b + side_c > side_a)
      true
    else
      puts "The sume of any two sides must be > the third side"
      false
    end
  end

  def valid_triangle?
    # return true if both requirements met
    side_length_verification & two_side_sum_verification
    # if one or both requirements not met, print "invalid triangle"
  end

  def equiliateral?; 
    # must pass valid_triangle? verification
    # return true if
    (side_a == side_b) & (side_b == side_c)
  end

  def isosceles?; 
    # must pass valid_triangle? verification
    # return true if
    (side_a == side_b) || (side_a == side_c) || (side_b == side_c)
  end

  def scalene?; 
    # must pass valid_triangle? verification
    # return true if
    (side_a != side_b) & (side_a != side_c) & (side_b != side_c)
  end

  def triangle_type?
    if equiliateral?
      puts "Type: Equilateral"
      @type = "equiliateral"
    elsif isosceles?
      puts "Type: Isosceles"
      @type = "isosceles" 
    elsif scalene?
      puts "Type: Scalene"
      @type = "scalene" 
    end
  end

end

# test = Triangle.new(0, 2, 3)
# p test.valid_triangle?
# test.triangle_type?
# p test.type
