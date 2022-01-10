import 'package:flutter/material.dart';
import 'package:flutter_auth_getx/controllers/auth_controller.dart';
import 'package:flutter_auth_getx/controllers/facebook_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/firebase_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/google_auth_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final firebaseCtrl = Get.put(FirebaseAuthCtrl());
  final facebookCtrl = Get.put(FacebookAuthCtrl());
  final googleCtrl = Get.put(GoogleAuthCtrl());
  final authCtrl = Get.put(AuthCtrl());

  getFunction(TypeLogin type) {
    if (type == TypeLogin.FIREBASE) {
      return firebaseCtrl.logOutFirebase();
    } else if (type == TypeLogin.FACEBOOK) {
      return facebookCtrl.logOutFacebook();
    } else if (type == TypeLogin.GOOGLE) {
      return googleCtrl.logOutGoogle();
    }
  }

  getData(TypeLogin type) {
    if (type == TypeLogin.FIREBASE) {
      return Text(firebaseCtrl.getUser.email);
    } else if (type == TypeLogin.FACEBOOK) {
      return Text(facebookCtrl.getUser["email"]);
    } else if (type == TypeLogin.GOOGLE) {
      return Text(googleCtrl.getUser.email);
    }
  }

  getType(TypeLogin type) {
    if (type == TypeLogin.FIREBASE) {
      return "Firebase";
    } else if (type == TypeLogin.FACEBOOK) {
      return "Facebook";
    } else if (type == TypeLogin.GOOGLE) {
      return "Google";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Color(0xff0f3057),
      ),
      body: Container(
        child: Center(
          child: Container(
            width: 300,
            height: 200,
            child: Column(
              children: [
                Text(
                    '=== User Loged with ${getType(authCtrl.getTypeLogin)} ==='),
                SizedBox(height: 20),
                getData(authCtrl.getTypeLogin),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Sign Out'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xff0f3057),
                    ),
                  ),
                  onPressed: () {
                    getFunction(authCtrl.getTypeLogin);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
