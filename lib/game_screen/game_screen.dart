import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/color_constant.dart';
import 'package:ledoyun2/core/constant/theme.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';
import 'package:ledoyun2/game_screen/widgets/drawer.dart';
import 'package:ledoyun2/game_screen/widgets/game_body.dart';

// ignore: must_be_immutable
class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    //ContextExtension

    return WillPopScope(
      onWillPop: () async {
        print('on will çalıştır');
        if (Platform.isAndroid) {
          print('android ');
          // Get.back();
          // await SystemNavigator.pop();
          //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        } else {
          print('android xx ');
          return true;
        }
        //
      },
      child: Scaffold(
        backgroundColor: ColorConstants.instance.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: myTheme.accentColor),
          centerTitle: true,
          backgroundColor: ColorConstants.instance.white,
          elevation: 0,
          title: Text(
            'Refleks Game',
            style: context.textTheme.headline5.copyWith(
                color: context.colors.secondary, fontWeight: FontWeight.bold),
          ),
          actions: buildActions(context),
        ),
        body: GameBody(),
        drawer: MyDrawer(),
      ),
    );
  }

  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.only(right: 2.0),
        child: Obx(() => GestureDetector(
              child: Icon(
                gameController.ses == true ? Icons.volume_up : Icons.volume_off,
                color: myTheme.accentColor,
                size: 20.0,
              ),
              onTap: () => gameController.sesAcKapat(),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(right: 2.0),
        child: Obx(() => GestureDetector(
              child: Icon(
                gameController.bebekmod == true
                    ? Icons.stroller
                    : Icons.no_stroller,
                color: myTheme.accentColor,
                size: 20.0,
              ),
              onTap: () => gameController.bebekmodAcKapat(),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(right: 2.0),
        child: Obx(() => GestureDetector(
              child: Icon(
                gameController.darkmod == false
                    ? Icons.lightbulb
                    : Icons.lightbulb_outlined,
                color: myTheme.accentColor,
                size: 20.0,
              ),
              onTap: themaDegistir,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(right: 2.0),
        child: GestureDetector(
          child: Icon(
            Icons.exit_to_app,
            color: myTheme.accentColor,
            size: 20.0,
          ),
          onTap: () {
            print('kapat');
            if (Platform.isAndroid) {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            } else if (Platform.isIOS) {
              //exit(0);
            }
          },
        ),
      ),
    ];
  }

  void themaDegistir() {
    gameController.darkmodAcKapat();
    Get.isDarkMode == false
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }
}
