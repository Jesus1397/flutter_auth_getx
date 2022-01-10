import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class FacebookAuthCtrl extends GetxController {
  final authCtrl = Get.put(AuthCtrl());
  var _user = Rxn<Map<String, dynamic>>();
  var _loginFacebook = false.obs;

  Map<String, dynamic> get getUser => this._user.value;
  bool get loginFacebook => this._loginFacebook.value;

  @override
  void onClose() {
    _loginFacebook.close();
    super.onClose();
  }

  Future<bool> signInFacebook() async {
    try {
      await FacebookAuth.instance.login(
        permissions: ["public_profile", "email"],
      );
      final user = await FacebookAuth.instance.getUserData();
      _user.value = user;
      _loginFacebook.value = true;
      authCtrl.loginWith(TypeLogin.FACEBOOK);
      update();
      return true;
    } catch (e) {
      print('🛑 F');
      return false;
    }
  }

  Future<bool> logOutFacebook() async {
    try {
      await FacebookAuth.instance.logOut();
      _user = Rxn<Map<String, dynamic>>();
      _loginFacebook.value = false;
      update();
      return true;
    } catch (e) {
      print('🛑 F');
      return false;
    }
  }
}
