require 'pry'

class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    valid = [(a + b > c), (b + c > a), (c + a > b)]
    [a, b, c].each do |side|
      valid << false if side <= 0
    raise TriangleError if valid.include?(false)
    end
    binding.pry
  end

  class TriangleError < StandardError
  end
end
