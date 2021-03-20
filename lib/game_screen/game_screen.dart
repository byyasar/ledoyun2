import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/color_constant.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';
import 'package:ledoyun2/game_screen/widgets/drawer.dart';
import 'package:ledoyun2/game_screen/widgets/game_body.dart';

// ignore: must_be_immutable
class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    //ContextExtension

    return Scaffold(
      backgroundColor: ColorConstants.instance.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.instance.white,
        elevation: 0,
        title: Text(
          'Refleks Game',
          style: context.textThema.headline5.copyWith(
              color: context.colors.secondary, fontWeight: FontWeight.bold),
        ),
        actions: buildActions(),
      ),
      body: GameBody(),
      drawer: MyDrawer(),
    );
  }

  List<Widget> buildActions() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 5.0),
        child: Obx(() => Icon(
              gameController.ses == true ? Icons.volume_up : Icons.volume_off,
              color: Colors.blue,
              size: 25.0,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5.0),
        child: Obx(() => Icon(
              gameController.bebekmod == true
                  ? Icons.stroller
                  : Icons.no_stroller,
              color: Colors.blue,
              size: 25.0,
            )),
      ),
    ];
  }
}
