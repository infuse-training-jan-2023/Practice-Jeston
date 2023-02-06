arr = [9, 5, 1, 2, 3, 4, 0, -1]

class Question2
  
  def element_at(arr, index)
    if index < 0 || arr.length < index
      'The given index is invalid'
    else
      (arr[index])
    end
  end

  def inclusive_range(arr, start_pos, end_pos)
    if arr.length < end_pos
      'The given indexes are not valid'
    elsif end_pos < start_pos
      'The end position cannot be lesser than the start position'
    else
      arr[start_pos..end_pos].inspect
    end
  end

  def non_inclusive_range(arr, start_pos, end_pos)
    if arr.length < end_pos
      'The given indexes are not valid'
    elsif end_pos < start_pos
      'The end position cannot be lesser than the start position'
    else
      arr[start_pos...end_pos].inspect
    end
  end

  def start_and_length(arr, start_pos, length)
    if arr.length < length || start_pos + length > arr.length
      'Array index out of bounds'
    else
      arr[start_pos, length].inspect
    end
  end
end

Q2 = Question2.new

puts Q2.element_at(arr, 0)
puts Q2.inclusive_range(arr, 1, 5)
puts Q2.non_inclusive_range(arr, 1, 5)
puts Q2.start_and_length(arr, 0, 7)