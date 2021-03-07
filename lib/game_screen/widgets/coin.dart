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
    return Stack(children: [
      Center(
        child: Container(
          //color: Colors.grey,
          height: 40,
          width: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),

         
        ),
      ),
      Center(
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: coinColor),
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    ]);
  }
}
