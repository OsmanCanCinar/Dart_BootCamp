class _User {
  final String name;
  int? age;

  dynamic newType;

  _User(this.name, {this.age});

  void updateNewType([String? str, int? num]) {
    if (str != null) {
      newType = str;
    } else if (num != null) {
      newType = num;
    }
  }
}

class Bank with BankMixin {
  int money;
  final String id;
  String? name;

  Bank(this.money, this.id);

  int operator +(Bank newBank) {
    return money + newBank.money;
  }

  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bank && other.id == id;
  }

  void setName(String name) {
    this.name = name;
  }

  @override
  int get hashCode => money.hashCode ^ id.hashCode;

  @override
  String toString() {
    return super.toString() + 'Osman';
  }

  @override
  void sayBankHello() {
    calculateMoney(money);
  }
}

mixin BankMixin {
  void sayBankHello();

  void calculateMoney(int money) {
    print('money');
  }
}

void main() {
  final user = _User('Osman', age: null);

  if (user.age is int) {
    if (user.age! < 18) {
      print('small');
    }
  }

  user.updateNewType(null, 2);
  print(user.newType is String);

  final a = user.newType.toString();
  final b = user.newType is String ? "it is" : user.newType.toString();

  print(a);
  print(b);

  final moneyBank1 = Bank(40, '12');
  final moneyBank2 = Bank(30, '12');

  print(moneyBank1 == moneyBank2);
  print(moneyBank1 + moneyBank2);

  moneyBank1.money += 10;
  print(moneyBank1.money);

  moneyBank1
    ..money += 10
    ..setName('can');

  print(moneyBank1);
}
