from src.item_repository import ItemRepository

items = [
  (3, 'Go to shopping', 'Not Started', 1),
  (5, 'Cmplete exercises', 'Not Started', 0),
  (5, 'new', 'Starting', 0),
]

new_item = [
  (1,'Go trekking',1)
]

item_repo = ItemRepository()

def test_get_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value = [])
  _ = item_repo.add_item()
  print("Item : ",new_item)
  assert mock.call_count == 1

def test_add_item(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value = new_item)
  item_returned = item_repo.add_item(new_item)
  print("Item Returned :",item_returned)
  
  assert mock.call_count == 1
  assert item_returned == new_item