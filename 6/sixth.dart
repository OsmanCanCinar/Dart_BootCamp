abstract class IUser {
  final String name;

  IUser(this.name);

  void tellMe();
}

class Turk implements IUser {
  @override
  String get name => 'Osman';

  @override
  void tellMe() {
    print('isim: $name');
  }
}

class English implements IUser {
  @override
  String get name => 'Adam';

  @override
  void tellMe() {
    print('name: $name');
  }
}

Future<void> main() async {
  // Polymorphism
  IUser turkish = Turk();
  IUser english = English();

  turkish.tellMe();

  // #1
  await Future.delayed(Duration(seconds: 1));
  english.tellMe();

  // #2
  await Future.forEach([1, 2, 3, 4, 5, 6], (int element) async {
    await Future.delayed(Duration(seconds: 1));
    print('done with $element');
  });

  // #3
  Future.delayed(Duration(seconds: 2)).whenComplete(() {
    print('hi');
  });

  Stream<int> money = Stream.empty();
  money = depositMoney(3, 10);
  money.listen(((event) {
    print(event);
  }));
}

Stream<int> depositMoney(int retryCount, int money) async* {
  int _localRetyr = 0;
  await Future.delayed(Duration(seconds: 1));
  while (_localRetyr < retryCount) {
    _localRetyr++;
    yield money += 5;
  }
}
