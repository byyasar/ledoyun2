import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/theme.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';

class Skorboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // myTheme
    // final GameController gameController = Get.find<GameController>();
//ContextExtension
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      //color: ColorConstants.instance.bgColor,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              levelBuild(context),
              hizBuild(context),
              puanBuild(context),
              hataBuild(context),
            ],
          )),
    );
  }

  Card levelBuild(BuildContext context) {
    final GameController gameController = Get.find<GameController>();
    return Card(
      color: myTheme.accentColor,
      shadowColor: myTheme.accentColor,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.time_to_leave_outlined,
              color: myTheme.canvasColor,
            ),
            SizedBox(width: 5),
            Text('level'.tr + ' : ${gameController.level}',
                style: context.textThema.subtitle1.copyWith(
                    color: myTheme.canvasColor, fontWeight: FontWeight.bold),
                textScaleFactor: 1.4),
          ],
        ),
      ),
    );
  }

  Card hizBuild(BuildContext context) {
    final GameController gameController = Get.find<GameController>();
    return Card(
      color: myTheme.accentColor,
      shadowColor: myTheme.accentColor,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.speed,
              color: myTheme.canvasColor,
            ),
            SizedBox(width: 5),
            Text('speed'.tr + ' : ${gameController.hiz}',
                style: context.textThema.subtitle1.copyWith(
                    color: myTheme.canvasColor, fontWeight: FontWeight.bold),
                textScaleFactor: 1.4),
          ],
        ),
      ),
    );
  }
}

puanBuild(BuildContext context) {
  final GameController gameController = Get.find<GameController>();
  return Card(
    color: myTheme.accentColor,
    shadowColor: myTheme.accentColor,
    elevation: 2.0,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.score,
            color: myTheme.canvasColor,
          ),
          SizedBox(width: 5),
          Text('score'.tr + ' : ${gameController.puan}',
              style: context.textThema.subtitle1.copyWith(
                  color: myTheme.canvasColor, fontWeight: FontWeight.bold),
              textScaleFactor: 1.4),
        ],
      ),
    ),
  );
}

hataBuild(BuildContext context) {
  final GameController gameController = Get.find<GameController>();
  return Card(
    color: myTheme.accentColor,
    shadowColor: myTheme.accentColor,
    elevation: 2.0,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            color: myTheme.canvasColor,
          ),
          SizedBox(width: 5),
          Text('error'.tr + ' : ${gameController.hata}',
              style: context.textThema.subtitle1.copyWith(
                  color: myTheme.canvasColor, fontWeight: FontWeight.bold),
              textScaleFactor: 1.4),
        ],
      ),
    ),
  );
}
