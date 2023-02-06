import sys
import os

limit=os.getenv("TEST")
for arg in sys.argv:
    print(arg)
l = len(sys.argv[1])
li = sys.argv[1][1:l-1].split(',')

    # Create an empty list
filter_arr = []  

# go through each element in arr
for element in li:
  # if the element is higher than 42, set the value to True, otherwise False:
  if int(element) > limit:
    filter_arr.append(True)
  else:
    filter_arr.append(False)

# newarr = li[filter_arr]

print(filter_arr)
# print(newarr)