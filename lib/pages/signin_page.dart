import 'package:flutter/material.dart';
import 'package:flutter_auth_getx/controllers/facebook_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/firebase_auth_controller.dart';
import 'package:flutter_auth_getx/controllers/google_auth_controller.dart';
import 'package:flutter_auth_getx/widgets/emailformfield_widget.dart';
import 'package:flutter_auth_getx/widgets/facebookbutton_widget.dart';
import 'package:flutter_auth_getx/widgets/googlebutton_widget.dart';
import 'package:flutter_auth_getx/widgets/passformfield_widget.dart';
import 'package:flutter_auth_getx/widgets/signuplink_widget.dart';
import 'package:flutter_auth_getx/widgets/submitbutton_widget.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final firebaseCtrl = Get.put(FirebaseAuthCtrl());
    final facebookCtrl = Get.put(FacebookAuthCtrl());
    final googleCtrl = Get.put(GoogleAuthCtrl());

    return Scaffold(
      backgroundColor: Color(0xff0f3057),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height,
            color: Color(0xff0f3057),
            padding: EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 60,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      EmailFormFieldWidget(
                        emailController: emailController,
                      ),
                      SizedBox(height: 30),
                      PassFormFieldWidget(
                        passwordController: passwordController,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SubmitButtonWidget(
                        text: 'Iniciar sesión',
                        onTap: () {
                          if (emailController.text != '' &&
                              passwordController.text != '') {
                            firebaseCtrl.signInFirebase(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: FacebookButtonWidget(),
                              onTap: () {
                                facebookCtrl.signInFacebook();
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              child: GoogleButtonWidget(),
                              onTap: () {
                                googleCtrl.signInGoogle();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      SignUpLinkWidget(
                        onTap: () {
                          Get.toNamed('signUp');
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
