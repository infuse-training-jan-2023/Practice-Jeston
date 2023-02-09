arr = [9, 5, 1, 2, 3, 4, 0, -1]

class Question2:

  def validate_array_size(self,arr,start_pos,end_pos):
    if len(arr) < end_pos or end_pos < start_pos:
      return False
    else:
      return True
    
  
  def element_at(self,arr, index):
    try:
        return (arr[index])
    except:
        raise IndexError("Array index out of bounds")
    

  def inclusive_range(self,arr, start_pos, end_pos):
    if(self.validate_array_size(arr,start_pos,end_pos)):
      return arr[start_pos:end_pos+1]
    else:
      return ("The given array is not of valid size")


  def non_inclusive_range(self,arr, start_pos, end_pos):
    if(self.validate_array_size(arr,start_pos,end_pos)):
      return arr[start_pos:end_pos]
    else:
      return ("The given array is not of valid size")

  def start_and_length(self,arr, start_pos, length):
    if len(arr) < length or start_pos + length > len(arr):
      raise IndexError("Array index out of bounds")
    else:
      return  arr[start_pos:length]
      

Q2 = Question2()
print(Q2.element_at(arr, 0))
print(Q2.inclusive_range(arr, 1, 5))
print(Q2.non_inclusive_range(arr, 1, 5))
print(Q2.start_and_length(arr, 0, 7))
