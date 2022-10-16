# typed: true

require 'sorbet-runtime'

extend T::Sig

def qs(arr, lo, high)
  return if lo >= high

  pivot_idx = partition(arr, lo, high)

  qs(arr, lo, pivot_idx - 1)
  qs(arr, pivot_idx + 1, high)
end

def partition(arr, lo, high)
  pivot = arr[high]
  p2 = lo - 1
  p1 = lo

  while p1 <= high
    if arr[p1] <= pivot
      p2 += 1
      arr[p1], arr[p2] = arr[p2], arr[p1]
    end

    p1 += 1
  end

  p2
end

sig { params(array: T::Array[T.untyped]).void }
def quicksort(array) = qs(array, 0, array.size - 1)
