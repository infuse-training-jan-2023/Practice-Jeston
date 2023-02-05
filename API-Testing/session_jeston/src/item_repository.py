
import sqlite3
import csv

class ItemRepository:
  NOT_STARTED = "Not Started"
  DBPATH = './todo.db'

  @staticmethod
  def connect_db():
    return sqlite3.connect(ItemRepository.DBPATH)
  
  @staticmethod
  def get_all_items():
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      rows = c.execute('select * from items')
      return rows
    except Exception as e:
      raise Exception('Error: ', e)

  @staticmethod
  def get_item(id):
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      c.execute('select * from items where id=?', (id))
      return c.fetchall()
    except Exception as e:
      raise Exception('Error: ', e)

  @staticmethod
  def add_item(item,status,reminder):
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      insert_cursor = c.execute('insert into items(item, status, reminder) values(?,?,?)', (item, status, reminder))
      conn.commit()
      return {
        'id': insert_cursor.lastrowid,
        'item': item,
        'status': ItemRepository.NOT_STARTED,
        'reminder': reminder
      }
    except Exception as e:
      raise Exception('Error: ', e)

  @staticmethod
  def delete_item(id):
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      insert_cursor = c.execute('delete from items WHERE id=?', (id))
      conn.commit()
      return {
        status:"deleted"
      }
    except Exception as e:
      raise Exception('Error: ', e)

  @staticmethod
  def update_item(id,item,reminder,statusnew):
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      sql_query = "UPDATE items SET "
      if item is not None:
        sql_query += ("item = '" + str(item) + "',")
      if statusnew is not None:
        sql_query += ("status = '" + str(statusnew) + "',")
      if reminder is not None:
        sql_query += (" reminder = '" + str(reminder) + "'")
      sql_query += (" WHERE id = " + str(id) )
      print(sql_query)
      insert_cursor = c.execute(sql_query)
      conn.commit()
      return {
        "status": "element updated successfully"
      }
    except Exception as e:
      raise Exception('Error: ', e)


  @staticmethod
  def savedata():
    try:
      conn = ItemRepository.connect_db()
      c = conn.cursor()
      rows = c.execute('select * from items')
      res = []
      for row in rows:
        res.append({
          'id': row[0],
          'item': row[1],
          'status': row[2],
          'reminder': row[3]
        })
      header = ['id', 'item', 'status', 'reminder']
      with open('items.csv', 'w') as f:
        writer = csv.DictWriter(f, header)
        writer.writeheader()
        writer.writerows(res)
      return {
        'status': 'Data saved to file'
      }
    except Exception as e:
      raise Exception('Error: ', e)