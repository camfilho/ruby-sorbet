# typed: true

require 'minitest/autorun'
require_relative './index'

class QuicksortTest < Minitest::Test
  def test_empty_array_returns_empty
    unsorted_array = []
    sorted_array = []
    
    quicksort((unsorted_array))
    assert_equal(sorted_array, unsorted_array)
  end

  def test_quicksort_sorts_array
    unsorted_array = [2,1]
    sorted_array = [1,2]

    quicksort((unsorted_array))
    assert_equal(sorted_array, unsorted_array)
  end

  def test_quicksort_sorts_negative_values
    arr = Array.new(2) { -rand(1000) }
    quicksort(arr)
    assert_equal(arr.sort, arr)
  end
end