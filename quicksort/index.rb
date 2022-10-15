def qs(arr, lo, high)
  puts "lo: #{lo}, high: #{high}"
  return if lo >= high

  pivot_idx = partition(arr, lo, high)
  puts "pivot index #{pivot_idx}"
  qs(arr, lo, pivot_idx - 1)
  qs(arr, pivot_idx + 1, high)
end

def partition(arr, lo, high)
  pivot = arr[high]
  jdx = lo - 1
  puts "initialize jdx #{jdx}"
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

  puts "return jdx #{jdx}"
  jdx
end

def quicksort(array) = qs(array, 0, array.size - 1)

a = Array.new(30) { rand(1000) }
quicksort(a)
p a
