array = ['Cricket', 'TT' , 'Football' , 'Hockey']

class Question3:
  def skip_sports(self,array, skip):
    arr= []
    if skip < 0 or len(array) < 0 or len(array) < skip:
      return 'The array size/index is not of valid'
    else:
        for index, element in enumerate(array):
            if index >= skip:
                str1 = str(index) + " : " + str(element)
                arr.append(str1)
        return arr

Q3 = Question3()
print(Q3.skip_sports(array, 2))
