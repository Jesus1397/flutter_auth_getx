import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red[700],
        borderRadius: BorderRadius.circular(5),
      ),
      child: FaIcon(
        FontAwesomeIcons.google,
        color: Colors.white,
      ),
    );
  }
}
