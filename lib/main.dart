import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_getx/pages/authwrapper_page.dart';
import 'package:flutter_auth_getx/pages/signin_page.dart';
import 'package:flutter_auth_getx/pages/signup_page.dart';
import 'package:get/get.dart';

import 'bindings/auth_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: 'authWrapper',
      routes: {
        'authWrapper': (_) => AuthWrapperPage(),
        'signIn': (_) => SignInPage(),
        'signUp': (_) => SignUpPage(),
      },
    );
  }
}
