import 'package:flutter/material.dart';
import 'package:ledoyun2/core/constant/cell_constant.dart';
import 'package:ledoyun2/core/constant/color_constant.dart';
import 'package:ledoyun2/game_screen/widgets/coin.dart';

enum cellMode {
  EMPTY,
  YELLOW,
  RED,
}

class Cell extends StatelessWidget {
  final currentCellMode;
  Cell({
    Key key,
    @required this.currentCellMode,
  }) : super(key: key);

  Coin _buildCoin() {
    switch (this.currentCellMode) {
      case cellMode.YELLOW:
        return Coin(
          coinColor: ColorConstants.instance.ledShowColor,
        );
        break;
      case cellMode.RED:
        return Coin(
          coinColor: ColorConstants.instance.ledOnColor,
        );
      default:
        return Coin(
          coinColor: ColorConstants.instance.ledOffColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: CellConstant.instance.cellBorderHeight,
          width: CellConstant.instance.cellBorderWitdh,
          //color: ColorConstants.instance.white,
          //color: Colors.grey[800],
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: _buildCoin(),
        ))
      ],
    );
  }
}
