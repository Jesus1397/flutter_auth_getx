import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookButtonWidget extends StatelessWidget {
  const FacebookButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(5),
      ),
      child: FaIcon(
        FontAwesomeIcons.facebookF,
        color: Colors.white,
      ),
    );
  }
}
