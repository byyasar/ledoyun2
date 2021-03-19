import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/color_constant.dart';
import 'package:ledoyun2/game_screen/widgets/drawer.dart';
import 'package:ledoyun2/game_screen/widgets/game_body.dart';

// ignore: must_be_immutable
class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.instance.white,
        elevation: 0,
        title: Text('Refleks Game', style: TextStyle(color: Colors.blue)),
      ),
      body: GameBody(),
      drawer: MyDrawer(),
    );
  }
}
