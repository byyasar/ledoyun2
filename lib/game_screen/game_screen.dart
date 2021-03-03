import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/controllers/timer_state.dart';
import 'package:ledoyun2/core/extension/color_constant.dart';
import 'package:ledoyun2/game_screen/widgets/game_body.dart';

// ignore: must_be_immutable
class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  final TimerState timeController = Get.put(TimerState());

  Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.instance.bgColor,
        elevation: 0,
        title: Text(
          'Refleks Game',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: GameBody(),
      // floatingActionButton: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     new FloatingActionButton(
      //         child: new Icon(Icons.play_arrow),
      //         heroTag: 1,
      //         onPressed: () {
      //           timeController.start();
      //         }),
      //     new FloatingActionButton(
      //         child: new Icon(Icons.stop),
      //         heroTag: 2,
      //         onPressed: () {
      //           timeController.pause();
      //         }),
      //   ],
      //),
    );
  }
}
