def windowed_max_range(arr, w)
  begin_idx = 0
  max_diff = 0
  end_idx = 0

  until end_idx == arr.length
    end_idx = begin_idx + w

    diff = arr[begin_idx...end_idx].max - arr[begin_idx...end_idx].min
    if diff > max_diff
      max_diff = diff
    end

    begin_idx += 1
  end

  max_diff
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
