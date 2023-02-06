
import sqlite3
import csv

class ItemRepository:
  def __init__(self) -> None:
        self.db_path = './todo.db'
        self.connection = None
        self.NOT_STARTED = "Not Started"

  def connect_db(self):
        if self.connection is None:
            self.connection =  sqlite3.connect(self.db_path, check_same_thread=False)
  
  def get_all_items(self):
    try:
      self.connect_db()
      cursor = self.connection.cursor()
      rows = cursor.execute('select * from items')
      return rows
    except Exception as e:
      raise Exception('Error: ', e)

  def get_item(self,id):
    try:
      self.connect_db()
      cursor = self.connection.cursor()
      cursor.execute('select * from items where id=?',(id,))
      return cursor.fetchall()
    except Exception as e:
      raise Exception('Error: ', e)

  
  def add_item(self,item,status,reminder):
    try:
      self.connect_db()
      cursor = self.connection.cursor()
      insert_cursor = cursor.execute('insert into items(item, status, reminder) values(?,?,?)', (item, status, reminder))
      self.connection.commit()
      return {
        'id': insert_cursor.lastrowid,
        'item': item,
        'status': ItemRepository.NOT_STARTED,
        'reminder': reminder
      }
    except Exception as e:
      raise Exception('Error: ', e)

  def delete_item(self,id):
    try:
      self.connect_db()
      cursor = self.connection.cursor()
      rows = c.execute('delete from items WHERE id=?', (id))
      conn.commit()
      return {
        status:"deleted"
      }
    except Exception as e:
      raise Exception('Error: ', e)

  
  def update_item(self,id,data):
    try:
      self.connect_db()
      cursor = self.connection.cursor()
      for key, value in data.items():
                rows = cursor.execute(f'UPDATE items SET {key}=? WHERE id=?', (value, id ))
      self.connection.commit()
      return {
        "status": "element updated successfully"
      }
    except Exception as e:
      raise Exception('Error: ', e)

  def savedata(self):
    try:
      self.connect_db()
      rows = self.get_all_items()
      return rows
    except Exception as e:
      raise Exception('Error: ', e)