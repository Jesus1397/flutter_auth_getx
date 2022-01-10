import 'package:flutter/material.dart';

class SignUpLinkWidget extends StatelessWidget {
  const SignUpLinkWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'No estas registrado?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        GestureDetector(
          child: Text(
            ' Registrate aca',
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
