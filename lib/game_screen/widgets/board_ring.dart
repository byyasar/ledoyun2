import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/game_screen/widgets/cell.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';

// ignore: must_be_immutable
class BoardRing extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  final List<int> columnOfPlayerChips;

  BoardRing({Key key, this.columnOfPlayerChips}) : super(key: key);

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
    List<Widget> ledList = List();
    var ix = 0;
    double artis = 360 / 16;
    //print(_buildBoardColumn().length);
    _buildBoardColumn().asMap().forEach((i, val) {
      //print('$i: $val');
      ix = (i * artis).toInt();
      var x = 140 * cos(ix * pi / 180) + 25;
      var y = 140 * sin(ix * pi / 180) + 25;
      var pos = new Positioned(child: val, top: 110 + x, left: 130 + y);
      ledList.add(pos);
    });
    return ledList;
  }

  var gen;
  var yuk;
  @override
  Widget build(BuildContext context) {
    gen = context.dynamicWidth(1);
    yuk = context.dynamicHeight(1);
    _listeyaz();
    return Stack(
      children: _listeyaz(),
    );
    // children: led(gen, yuk));
  }

  List<Widget> led(double gen, double yuk) {
    List<Widget> ledList = List();

    int artis = (360 ~/ 16);
    for (int i = 0; i < 360; i += artis) {
      var x = 140 * cos(i * pi / 180) + 25;
      var y = 140 * sin(i * pi / 180) + 25;

      var pos = new Positioned(
        child: new Cell(
          currentCellMode: cellMode.YELLOW,
        ),
        top: 110 + x,
        left: 130 + y,
      );
      ledList.add(pos);
    }

    return ledList;
  }
}
