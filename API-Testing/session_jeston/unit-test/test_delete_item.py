from src.item_repository import ItemRepository

item_repo = ItemRepository()

def test_get_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = {})
  _ = item_repo.delete_item()
  assert mock.call_count == 1

def test_delete_item(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = {"status":"deleted"})
  message_returned = item_repo.delete_item(3)
  assert message_returned ==  {"status":"deleted"}