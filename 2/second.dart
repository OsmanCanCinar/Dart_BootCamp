void main() {
  final List<int> listOne = [100, 110, 120, 130];

  List<int> listTwo = [1, -5, 4, 10, -7];

  listOne.add(140);
  listOne.insert(1, 105);

  listTwo.sort();
  print(listTwo);

  listOne.clear();
  print(listOne);

  // generates a new list
  listTwo.reversed.toList();

  // ** Optional Parameter **
  void exampleFunction(int a, {int b = 10, required int c}) {
    print('a: $a + b: $b + c: $c = ${a + b + c}');
  }

  exampleFunction(1, b: 20, c: 6);
  exampleFunction(1, c: 6);

  // too hard to control, avoid it!
  List<dynamic> list = [1, 'a', true];

  List<String> namesList = ['osman', 'can', 'çınar'];

  //use this instead
  print(namesList.contains('osman'));

  //looks good but more complicated!
  for (var i in namesList) {
    if (i == 'can') {
      print('can');
    }
  }
}
