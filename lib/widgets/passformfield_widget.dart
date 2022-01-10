import 'package:flutter/material.dart';

class PassFormFieldWidget extends StatelessWidget {
  const PassFormFieldWidget({
    Key key,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return 'Contraseña incorrecta';
        }
        return null;
      },
      controller: passwordController,
      cursorColor: Color(0xff00587a),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Contraseña",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff00587a),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff00587a),
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
