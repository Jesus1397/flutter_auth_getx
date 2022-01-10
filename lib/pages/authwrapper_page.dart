import 'package:flutter/material.dart';
import 'package:flutter_auth_getx/controllers/auth_controller.dart';
import 'package:flutter_auth_getx/controllers/facebook_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/firebase_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/google_auth_controller.dart';
import 'package:flutter_auth_getx/pages/signin_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class AuthWrapperPage extends StatelessWidget {
  final firebaseCtrl = Get.put(FirebaseAuthCtrl());
  final facebookCtrl = Get.put(FacebookAuthCtrl());
  final googleCtrl = Get.put(GoogleAuthCtrl());
  final authCtrl = Get.put(AuthCtrl());

  @override
  Widget build(BuildContext context) {
    //=== prints() ===
    print('🥶 ${authCtrl.getTypeLogin} ');

    // === Validation ===
    return Obx(
      () {
        if (firebaseCtrl.loginFirebase != false ||
            facebookCtrl.loginFacebook != false ||
            googleCtrl.loginGoogle != false) {
          return HomePage();
        }
        return SignInPage();
      },
    );
  }
}
