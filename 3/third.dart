void main() {
  Map<String, int> users = {'osman': 1997, 'ozlem': 1970};

  for (var item in users.keys) {
    print('${item} - ${users[item]}');
  }

  for (var i = 0; i < users.length; i++) {
    print('${users.keys.elementAt(i)} - ${users.values.elementAt(i)}');
  }

  final Map<String, List<int>> list = {
    'can': [10, 20, 30]
  };

  list['cengiz'] = [40, 50, 60];

  for (var item in list.keys) {
    int res = 0;
    for (var point in list[item]!) {
      if (point < 10) {
        print('cant to cont');
        break;
      } else {
        res += point;
      }
    }
    print('$item -> $res');
  }
}
