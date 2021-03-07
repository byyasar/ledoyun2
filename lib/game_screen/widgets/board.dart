import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/controllers/timer_state.dart';
//import 'package:ledoyun2/core/extension/color_constant.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';
import 'package:ledoyun2/game_screen/widgets/board_ring.dart';
import 'package:ledoyun2/game_screen/widgets/skorboard.dart';

// ignore: must_be_immutable
class Board extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  final TimerState timeController = Get.find<TimerState>();

  List<BoardRing> _buildBoard() {
    //int currentColumnNumber = 0;

    return gameController.board
        .map((boardColumn) => BoardRing(
              columnOfPlayerChips: boardColumn,
              //columnNumber: currentColumnNumber++,
            ))
        .toList();
  }

  var gen;
  var yuk;
  @override
  Widget build(BuildContext context) {
    gen = context.dynamicWidth(1);
    yuk = context.dynamicHeight(1);
    print('gen $gen yuk $yuk');
    return Container(
      //color: ColorConstants.instance.bgColor,
      width: gen,
      height: yuk,
      child: GetBuilder<GameController>(
        builder: (GetxController gameController) => Column(children: [
          Expanded(flex: 2, child: Skorboard()),
          Expanded(flex: 6, child: Stack(children: _buildBoard())),
        ]),
      ),
    );
  }
}
