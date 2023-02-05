
from item_repository import ItemRepository
import csv

class ItemActions:
  def __init__(self) -> None:
    self.item_repo = ItemRepository()

  def get_all_items(self):
    try:
      items = self.item_repo.get_all_items()
      res = []
      for item in items:
        res.append({
          'id': item[0],
          'item': item[1],
          'status': item[2],
          'reminder': item[3],
        })
      return res
    except Exception as e:
      print(e)
      return {}

  def get_item(self,id):
    try:
      item = self.item_repo.get_item(id)
      res=[]
      res.append({
          'id': item[0][0],
          'item': item[0][1],
          'status': item[0][2],
          'reminder': item[0][3],
        })
      return res
    except Exception as e:
      print(e)
      return {}

  def add_item(self, item,status,reminder):
    try:
      item = self.item_repo.add_item(item,status,reminder)
      return item
    except Exception as e:
      print(e)
      return {}

  def delete_item(self,id):
    try:
      item = self.item_repo.delete_item(id)
      return item
    except Exception as e:
      print(e)
      return {}

  def update_item(self,id,item,reminder,status):
    try:
      item = self.item_repo.update_item(id,item,reminder,status)
      print(item)
      return item
    except Exception as e:
      print(e)
      return {} 

  def savedata(self):
    try:
      items = self.item_repo.savedata()
      return items
    except Exception as e:
      print(e)
      return {} 
  
  