from src.item_repository import ItemRepository

items = [
  (3, 'Go to shopping', 'Not Started', 1),
  (5, 'Cmplete exercises', 'Not Started', 0),
  (5, 'new', 'Starting', 0),
]

new_item = [
  (1,'Go trekking','planning',1)
]

item_repo = ItemRepository()

def test_get_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = {})
  _ = item_repo.delete_item()
  assert mock.call_count == 1

def test_delete_item(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = {"status":"deleted"})
  message_returned = item_repo.delete_item(3)
  assert message_returned ==  {"status":"deleted"}