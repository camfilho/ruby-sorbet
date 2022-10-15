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
  jdx = lo - 1

  i = lo
  while i < high
    if arr[i] <= pivot
      jdx += 1
      temp = arr[i]
      arr[i] = arr[jdx]
      arr[jdx] = temp
    end

    i += 1
  end

  jdx += 1
  arr[high] = arr[jdx]
  arr[jdx] = pivot

  jdx
end

def quicksort(array) = qs(array, 0, array.size - 1)
