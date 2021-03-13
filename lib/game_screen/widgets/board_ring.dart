import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/cell_constant.dart';
import 'package:ledoyun2/game_screen/widgets/cell.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';

// ignore: must_be_immutable
class BoardRing extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  final List<int> columnOfPlayerChips;

  BoardRing({Key key, this.columnOfPlayerChips}) : super(key: key);

  var gen;
  var yuk;
  var ratio;

  List<Cell> _buildBoardColumn() {
    print(columnOfPlayerChips);

    return columnOfPlayerChips.reversed
        .map((number) => number == 1
            ? Cell(
                currentCellMode: cellMode.YELLOW,
              )
            : number == 2
                ? Cell(
                    currentCellMode: cellMode.RED,
                  )
                : Cell(
                    currentCellMode: cellMode.EMPTY,
                  ))
        .toList();
  }

  List<Widget> _listeyaz() {
    List<Widget> ledList = [];
    var ix = 0;
    double artis = 360 / CellConstant.instance.ledSayisi;
    //print(_buildBoardColumn().length);
    _buildBoardColumn().asMap().forEach((i, val) {
      //print('$i: $val');
      ix = (i * artis).toInt();
      var y = CellConstant.instance.yaricap * cos(ix * pi / 180);
      var x = CellConstant.instance.yaricap * sin(ix * pi / 180);
      var pos = new Positioned(
          child: val,
          top: yuk / 2 + y - CellConstant.instance.cellBorderHeight / 2,
          left: gen / 2 + x - CellConstant.instance.cellBorderWitdh / 2);
      ledList.add(pos);
    });
    return ledList;
  }

  @override
  Widget build(BuildContext context) {
    gen = context.dynamicWidth(.9);
    //yuk = context.dynamicHeight(1);
    yuk = CellConstant.instance.yaricap * 2.4;
    ratio = context.devicePixelRatio;
    //var widthTrans = context.widthTransformer();
    print('Device ${context.widthTransformer()}');
    _listeyaz();
    return Container(
      width: gen,
      height: yuk,
      //color: ColorConstants.instance.bgColor,
      //color: ColorConstants.instance.white, //tüm çember arka plan
      child: Stack(
        children: _listeyaz(),
      ),
    );
  }
}
