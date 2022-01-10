import 'package:flutter/material.dart';

class EmailFormFieldWidget extends StatelessWidget {
  const EmailFormFieldWidget({
    Key key,
    @required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email no valido';
        }
        return null;
      },
      controller: emailController,
      cursorColor: Color(0xff00587a),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "E - mail",
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
      style: TextStyle(color: Colors.white),
    );
  }
}
