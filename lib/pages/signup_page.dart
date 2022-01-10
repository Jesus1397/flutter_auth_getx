import 'package:flutter/material.dart';
import 'package:flutter_auth_getx/controllers/firebase_auth_controller.dart';
import 'package:flutter_auth_getx/widgets/emailformfield_widget.dart';
import 'package:flutter_auth_getx/widgets/facebookbutton_widget.dart';
import 'package:flutter_auth_getx/widgets/googlebutton_widget.dart';
import 'package:flutter_auth_getx/widgets/passformfield_widget.dart';
import 'package:flutter_auth_getx/widgets/signinlink_widget.dart';
import 'package:flutter_auth_getx/widgets/submitbutton_widget.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final firebaseCtrl = Get.put(FirebaseAuthCtrl());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0f3057),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height - kToolbarHeight,
            padding: EdgeInsets.only(
              left: 60,
              right: 60,
              bottom: 60,
              top: 60 - kToolbarHeight,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign Up',
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
                        SizedBox(height: 30),
                      ],
                    ),
                    Column(
                      children: [
                        SubmitButtonWidget(
                          text: 'Registrarse',
                          onTap: () {
                            if (emailController.text != '' &&
                                passwordController.text != '') {
                              firebaseCtrl
                                  .signUpFirebase(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              )
                                  .then((value) {
                                Get.back();
                              });
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: FacebookButtonWidget(),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: GoogleButtonWidget(),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        SignInLinkWidget(
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
