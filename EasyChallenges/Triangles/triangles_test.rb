require 'minitest/autorun'
require_relative 'triangles'

class TriangleTest < Minitest::Test
  def setup
    @equiliateral = Triangle.new(3, 3, 3)
    @isosceles = Triangle.new(2, 2, 3)
    @scalene = Triangle.new(2, 3, 4)
    @invalid_zero = Triangle.new(0, 2, 3)
    @invalid_twosidesum = Triangle.new(1, 2, 3)
  end

  def test_side_length_verification
    assert_equal(true, @equiliateral.side_length_verification)
    assert_equal(false, @invalid_zero.side_length_verification)
  end

  def test_two_side_sum_verification
    assert_equal(true, @equiliateral.two_side_sum_verification)
    assert_equal(false, @invalid_twosidesum.two_side_sum_verification)
  end

  def test_valid_triangle?
    assert_equal(true, @equiliateral.valid_triangle?)
    assert_equal(false, @invalid_zero.valid_triangle?)
  end

  def test_equiliateral?
    assert_equal(true, @equiliateral.equiliateral?)
  end

  def test_isosceles?
    assert_equal(true, @isosceles.isosceles?)
  end

  def test_scalene?
    assert_equal(true, @scalene.scalene?)
  end

  def test_triangle_type?
    assert_equal('scalene', @scalene.triangle_type?)
  end

  def teardown; end
end
