import 'package:flutter/material.dart';
import 'package:ledoyun2/core/constant/cell_constant.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';

class Coin extends StatelessWidget {
  //final Color coinColor;
  final List<Color> coinColor;

  const Coin({
    Key key,
    @required this.coinColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gen = context.dynamicWidth(1);
    double oran = gen / 400;
    oran >= 1.50 ?oran= 1.50 : oran= gen / 400;
    print('oran $oran');
    return Stack(children: [
      Center(
        child: Container(
          //color: Colors.grey,

          height: CellConstant.instance.cellBackHeight * oran,
          width: CellConstant.instance.cellBackWitdh * oran,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  CellConstant.instance.cellBackWitdh * oran),
              color: Colors.white),
        ),
      ),
      Center(
        child: Container(
          height: CellConstant.instance.cellHeight * oran,
          width: CellConstant.instance.cellWitdh * oran,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: coinColor),
              borderRadius: BorderRadius.circular(
                  CellConstant.instance.cellHeight * oran)),
        ),
      ),
    ]);
  }
}
