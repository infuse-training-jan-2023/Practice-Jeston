from src.item_repository import ItemRepository

item_repo = ItemRepository()

def test_get_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.update_item', return_value = {})
  _ = item_repo.update_item()
  assert mock.call_count == 1

def test_update_item(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.update_item', return_value = {"status": "element updated successfully"})
  message_returned = item_repo.update_item(2,"new item","reminder",0)
  assert message_returned ==  {"status": "element updated successfully"}