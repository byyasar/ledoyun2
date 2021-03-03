import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/extension/color_constant.dart';

class Skorboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find<GameController>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: ColorConstants.instance.bgColor,
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Level : ${gameController.level}',
                    style: context.textTheme.subtitle1
                        .copyWith(color: ColorConstants.instance.blueAccent)),
                Text('Hız :${gameController.hiz}',
                    style: context.textTheme.subtitle1
                        .copyWith(color: ColorConstants.instance.blueAccent)),
                Text('Puan :${gameController.puan}',
                    style: context.textTheme.subtitle1
                        .copyWith(color: ColorConstants.instance.blueAccent)),
                Text('Hata :${gameController.hata}',
                    style: context.textTheme.subtitle1
                        .copyWith(color: ColorConstants.instance.blueAccent)),
              ],
            )),
      ),
    );
  }
}
