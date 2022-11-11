import 'singleton.dart';

void main() {
  // a car object
  final model = CarModel(
      category: CarModels.bmw,
      name: 'bmw x5',
      money: 1412,
      isSecondHand: false);

  // a list that consists of car objects
  final carItems = [
    CarModel(
        category: CarModels.bmw,
        name: 'bmw x5',
        money: 12,
        isSecondHand: false),
    CarModel(category: CarModels.toyota, name: 'toyota 234234', money: 45),
    CarModel(
        category: CarModels.yamaha,
        name: 'ymaaha 3324',
        money: 44,
        isSecondHand: false),
    CarModel(category: CarModels.bmw, name: 'bmw x5', money: 33),
    CarModel(
        category: CarModels.toyota,
        name: 'toyota 0ye',
        money: 55,
        isSecondHand: false),
  ];

  // **list function 'where' to like query.
  final resultCount =
      carItems.where((element) => element.isSecondHand == true).length;
  print(resultCount);

  // car object
  final newCar = CarModel(category: CarModels.bmw, name: 'bmw x5', money: 33);

  // ** list function 'contains' is like 'in'
  final isHaveCar = carItems.contains(newCar);

  if (isHaveCar) {
    print('we have it');
  } else {
    print('we dont have it');
  }

  // **you can combine 'where' and 'join'. 'join' converts it to toString and concatenates
  final reusltBmwMore20 = carItems.where((element) {
    return element.category == CarModels.bmw && element.money > 20;
  }).join();

  print(reusltBmwMore20);

  // **map function creates another list of objects in specified type.
  final carNames = carItems.map((e) => e.name).join(',');
  print('carNames: $carNames');

  bool isHaveCarMercedes = false;
  // try-catch-finally combo
  try {
    // Checks for only one element that satisfies the condition
    final mercedesCar = carItems
        .singleWhere((element) => element.category == CarModels.mercedes);
    print('singleWhere: ${mercedesCar.name}');
    isHaveCarMercedes = true;
  } catch (e) {
    print('arabaa yok abi');
    isHaveCarMercedes = false;
  } finally {
    print('abi bu islem agir oldu bidaha sroma $isHaveCarMercedes');
  }

  // returns the index of the given element
  final index = carItems.indexOf(newCar);
  print(index);

  final _mercedes =
      CarModel(category: CarModels.mercedes, name: 'merer', money: 12312);
  carItems.add(_mercedes);
  // Sorts according the attribute of the objects ASC-DESC
  carItems.sort((first, second) => second.money.compareTo(first.money));

  final users = carItems.expand((element) => element.users).toList();
  calculateToUser(carItems);
  carItems.remove(_mercedes);
  carItems.removeWhere(
      (element) => element.category == CarModels.bmw || element.money < 30);
  print(carItems);
}

void calculateToUser(List<CarModel> items) {
  // itemleri duzelt bmw olanlari yamaha
  final _items = [...items.toList()];
  final newItems = _items.map((CarModel e) {
    return CarModel(
        category: e.category == CarModels.bmw ? CarModels.yamaha : e.category,
        name: e.name,
        money: e.money,
        isSecondHand: false);
  }).toList();

  print(newItems);
}

class CarModel {
  CarModels category;
  final String name;
  final double money;

  String? city;
  bool isSecondHand;
  List<User> users;

  CarModel(
      {required this.category,
      required this.name,
      required this.money,
      this.city,
      this.isSecondHand = true,
      this.users = const []});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarModel &&
        other.category == category &&
        other.name == name &&
        other.money == money &&
        other.city == city &&
        other.isSecondHand == isSecondHand;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        name.hashCode ^
        money.hashCode ^
        city.hashCode ^
        isSecondHand.hashCode;
  }

  @override
  String toString() {
    return '$name - $money';
  }
}

enum CarModels { bmw, yamaha, toyota, mercedes }
