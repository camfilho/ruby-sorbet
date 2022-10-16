def quicksort(arr)
  return arr if arr.size <= 1

  pivot_index = rand(arr.size)
  pivot = arr[pivot_index]

  right_arr = arr.select.with_index { |el, idx| el >= pivot && idx != pivot_index }
  left_arr = arr.select.with_index { |el, idx| el < pivot && pivot_index != idx }

  quicksort(left_arr) + [pivot] + quicksort(right_arr)
end
