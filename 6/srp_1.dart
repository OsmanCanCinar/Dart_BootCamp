void main() {
  final UserManager manager = UserManager(name: 'Can');
  manager.introduceYourself();

  final UserLocalization u_loc = UserLocalization(userManager: manager);
  u_loc.updateLocalization();

  manager.introduceYourself();
}

class UserManager {
  String name;

  UserManager({required this.name});

  void changeUsername(String name) {
    this.name = name;
  }

  void introduceYourself() {
    print('My name is $name');
  }
}

class UserLocalization {
  final UserManager userManager;

  UserLocalization({required this.userManager});

  void updateLocalization() {
    userManager.changeUsername('Osman');
    changeLocalization();
  }

  void changeLocalization() {
    print('Localization Changed!');
  }
}
