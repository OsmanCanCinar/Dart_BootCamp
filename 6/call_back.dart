void main(List<String> args) {
  final user = User(money: 5);

  user.calculateMoney((int result) {
    print(user.money);
    return result + 5;
  });

  final generic = ToBeGeneric(data: 'asd');
  final generic2 = ToBeGeneric(data: 5);

  final admin = Admin();

  //removeUser(user); //ERROR
  removeUser(admin);
}

typedef CalculateCallBack = int Function(int data);

class User {
  @deprecated
  int money;
  User({
    required this.money,
  });

  void calculateMoney(CalculateCallBack onComplete) {
    money += 5;
    final passData = onComplete(money);
  }

  @Todo('seth', 'make this do something')
  void a() {}
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

class ToBeGeneric<T> {
  T data;
  ToBeGeneric({required this.data});
}

abstract class IAdmin {
  void removeUser();
}

class Admin extends IAdmin {
  @override
  void removeUser() {
    // TODO: implement removeUser
  }
}

void removeUser<T extends IAdmin>(T data) {
  data.removeUser();
}
