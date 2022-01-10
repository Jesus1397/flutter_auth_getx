import 'package:get/get.dart';

enum TypeLogin {
  NONE,
  FIREBASE,
  FACEBOOK,
  GOOGLE,
}

class AuthCtrl extends GetxController {
  Rx<TypeLogin> _typeLogin = TypeLogin.NONE.obs;

  TypeLogin get getTypeLogin => this._typeLogin.value;

  void loginWith(TypeLogin type) {
    _typeLogin.value = type;

    update();
  }
}
