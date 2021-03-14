import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/timer_state.dart';
import 'package:ledoyun2/game_screen/widgets/board.dart';

class GameBody extends StatelessWidget {
  final TimerState timeController = Get.put(TimerState());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          timeController.isRunning.value == true
              ? timeController.pause()
              : timeController.start();
        },
        child: Container(color: Colors.white, child: Board()));
  }
}
