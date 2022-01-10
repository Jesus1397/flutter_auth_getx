import 'package:flutter/material.dart';

class SignInLinkWidget extends StatelessWidget {
  final Function onTap;

  const SignInLinkWidget({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tenes cuenta?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        GestureDetector(
          child: Text(
            ' Iniciar sesión',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
