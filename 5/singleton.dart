import 'product_config.dart';

void main() {
  final newProduct = Product.money;
  print(Product.money);

  productNameChange();
  print(Product.money);

  calculateMoney(Product.money ?? 0);

  final user1 = User('veli', 'aa');

  //works well
  final newProduct2 = Product(user1.product);
  //but this is better practice
  final newProduct3 = Product.fromUser(user1);

  productNameChange();

  ProductConfig.instance.apiKey;
  ProductLazySingleton.instance;
}

void calculateMoney(int money) {
  if (money > 5) {
    print('5 tl daha ekledik');
    Product.incerementMoney(5);
    print(Product.money);
  }
}

void productNameChange() {
  Product.money = null;
}

class Product {
  // static variables are reachable from everywhere but dangerous
  static int? money = 10;
  String name;

  // Default Constructor
  Product(this.name);

  // Customize Default Constructor
  Product.veli([this.name = 'veli']);

  // Factory Constructor
  factory Product.fromUser(User user) {
    return Product(user.name);
  }

  static const companyName = "VB BANK";

  // Same for static methods
  static void incerementMoney(int newMoney) {
    if (money != null) {
      money = money! + newMoney;
    }
  }
}

class User {
  final String name;
  final String product;

  User(this.name, this.product);
}
