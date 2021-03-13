import 'package:flutter/material.dart';
import 'package:ledoyun2/core/constant/cell_constant.dart';

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
          height: CellConstant.instance.cellBackHeight,
          width: CellConstant.instance.cellBackWitdh,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(CellConstant.instance.cellBackWitdh),
              color: Colors.white),
        ),
      ),
      Center(
        child: Container(
          height: CellConstant.instance.cellHeight,
          width: CellConstant.instance.cellWitdh,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: coinColor),
              borderRadius:
                  BorderRadius.circular(CellConstant.instance.cellHeight)),
        ),
      ),
    ]);
  }
}
