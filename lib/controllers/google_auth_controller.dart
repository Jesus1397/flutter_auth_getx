import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_controller.dart';

class GoogleAuthCtrl extends GetxController {
  final authCtrl = Get.put(AuthCtrl());
  var _user = Rxn<GoogleSignInAccount>();
  var _loginGoogle = false.obs;

  GoogleSignInAccount get getUser => this._user.value;
  bool get loginGoogle => this._loginGoogle.value;

  @override
  void onClose() {
    _user.close();
    super.onClose();
  }

  Future signInGoogle() async {
    try {
      final userSignIn = await GoogleSignIn().signIn();

      final googleAuth = await userSignIn.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _user.value = userSignIn;
      _loginGoogle.value = true;
      authCtrl.loginWith(TypeLogin.GOOGLE);
      update();
      return true;
    } catch (e) {
      print('🛑 F');
      return false;
    }
  }

  Future logOutGoogle() async {
    try {
      await GoogleSignIn().disconnect();
      FirebaseAuth.instance.signOut();
      _user = Rxn<GoogleSignInAccount>();
      _loginGoogle.value = false;
      update();
      return true;
    } catch (e) {
      print('🛑 F');
      return false;
    }
  }
}
