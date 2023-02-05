
import sqlite3

class UserRepository:
  DBPATH = './todo.db'

  @staticmethod
  def connect_db():
    return sqlite3.connect(UserRepository.DBPATH)

  @staticmethod
  def add_user(name,age,mobile):
    try:
      conn = UserRepository.connect_db()
      c = conn.cursor()
      print(name,age,mobile)
      res=c.execute("INSERT INTO user (name,age,mobile) VALUES (?,?,?)",(name,age,mobile))
      conn.commit()
      return res
    except Exception as e:
      raise Exception('Error: ', e)