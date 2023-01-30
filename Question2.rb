arr = [9, 5, 1, 2, 3, 4, 0, -1]

class Question2
  
  def element_at(arr, index)
    if index < 0 || arr.length < index
      'The given index is invalid'
    else
      (arr[index])
    end
  end
end

Q2 = Question2.new

puts Q2.element_at(arr, 0)