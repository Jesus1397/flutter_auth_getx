import 'package:flutter_auth_getx/controllers/auth_controller.dart';
import 'package:flutter_auth_getx/controllers/facebook_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/firebase_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/google_auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseAuthCtrl());
    Get.lazyPut(() => FacebookAuthCtrl());
    Get.lazyPut(() => GoogleAuthCtrl());
    Get.lazyPut(() => AuthCtrl());
  }
}
