import 'user_model.dart';

void main() {
  // #1 declare & initialize it.
  int a = 0;
  List<int> list1 = [1, 2, 3];
  print(a);

  // #2 declare it as nullable.
  int? b;
  List<int?> list2 = [1, null, 3];
  print(b);

  // returns int or null and takes nullable int as parameter
  int? controlPoints(int? a) {
    if (a != null && a > 0) {
      return a;
    } else {
      return null;
    }
  }

  for (var i in list2) {
    if (i == null) {
      print('$i. element is null');
    } else {
      print('$i');
    }

    // if it returns null then value will be assigned as false, else it is true.
    bool result = controlPoints(i) == null ? false : true;
    print(result);
  }

  int? c;
  //if null then assign it 2.
  int z = c ?? 2;
  print('z: $z');

  print('----------' * 3);

  //  #1 Regular Constructor with default, named and nullable parameters.
  //User user1 = User('osman', 12, age: 53, city: 'izmir');
  //User user2 = User('can', 124, age: null, city: null);

  //  #2 Regular Constructor with default and nullable parameters.
  //User user3 = User('osman', 12, 53, 'izmir');
  //User user4 = User('can', 124, null, null);

  //  #3 Syntatic Sugar Constructor with named and nullable parameters.
  User user5 = User('cengiz', 23532, age: 123, city: 'aadasf');
  User user6 = User('ozlem', 510);

  //  #4 Syntatic Sugar Constructor with optional parameters.
  //User user7 = User('cengiz', 23532, 123, 'aadasf');
  //User user8 = User('ozlem', 500);

  //  #5 Constructor with default, required and named parameters.
  //User user9 = User('cengiz', 23532, age: 12, city: 'aadasf');
  //User user10 = User('ozlem', 500, age: 12);

  print(user6.amount.toString());
}
