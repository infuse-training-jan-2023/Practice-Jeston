arr = [9, 5, 1, 2, 3, 4, 0, -1]

class Question2:
  
  def element_at(self,arr, index):
    try:
        return (arr[index])
    except:
        return ("The given index is invalid")
    

  def inclusive_range(self,arr, start_pos, end_pos):
    if len(arr) < end_pos:
      return 'The given indexes are not valid'
    elif end_pos < start_pos:
      return 'The end position cannot be lesser than the start position'
    else:
      return arr[start_pos:end_pos+1]

  def non_inclusive_range(self,arr, start_pos, end_pos):
    if len(arr) < end_pos:
      return 'The given indexes are not valid'
    elif end_pos < start_pos:
      return 'The end position cannot be lesser than the start position'
    else:
      return arr[start_pos:end_pos]

  def start_and_length(self,arr, start_pos, length):
    if len(arr) < length or start_pos + length > len(arr):
      return 'Array index out of bounds'
    else:
      return  arr[start_pos:length]

Q2 = Question2()
print(Q2.element_at(arr, 0))
print(Q2.inclusive_range(arr, 1, 5))
print(Q2.non_inclusive_range(arr, 1, 5))
print(Q2.start_and_length(arr, 0, 7))
