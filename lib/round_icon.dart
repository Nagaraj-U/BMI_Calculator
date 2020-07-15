import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  RoundIconButton({@required this.icon,@required this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,
        size: 20,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
          width: 52,
          height: 52
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}
