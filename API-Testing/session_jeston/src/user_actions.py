from user_repository import UserRepository

class UserActions:
    def __init__(self) -> None:
        self.user_repo = UserRepository()

    def add_user(self,name,age,mobile):
        try:
            print(name,age,mobile)
            item = self.user_repo.add_user(name,age,mobile)
            return {
                'id': item.lastrowid,
                'name': name,
                'age': age,
                'mobilr': mobile
            }
        except Exception as e:
            print(e)
        return {}

    