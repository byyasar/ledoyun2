import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  //final Color coinColor;
  final List<Color> coinColor;

  const Coin({
    Key key,
    @required this.coinColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: coinColor),
          borderRadius: BorderRadius.circular(32)),
    );
  }
}
