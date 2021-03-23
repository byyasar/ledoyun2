import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';
import 'package:ledoyun2/core/constant/theme.dart';
import 'package:ledoyun2/core/extension/context_extension.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ContextExtension
    final GameController gameController = Get.find<GameController>();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'settings'.tr,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: myTheme.accentColor,
            ),
          ),
          Obx(() => Card(
                child: ListTile(
                  leading: Icon(
                    gameController.ses == true
                        ? Icons.volume_up
                        : Icons.volume_off,
                    color: myTheme.accentColor,
                    size: 25.0,
                  ),
                  title: Row(
                    children: [
                      Spacer(),
                      Text(
                        'soundmode'.tr +
                            ':\n' +
                            (gameController.ses == true
                                ? "open".tr
                                : "close".tr),
                        style: context.textThema.subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Spacer()
                    ],
                  ),
                  trailing: MergeSemantics(
                    child: CupertinoSwitch(
                      activeColor: Colors.green,
                      trackColor: Colors.red,
                      value: gameController.ses,
                      onChanged: (bool value) {
                        gameController.sesAcKapat();
                      },
                    ),
                  ),
                ),
              )),
          Obx(() => Card(
                child: ListTile(
                  leading: Icon(
                    gameController.bebekmod == true
                        ? Icons.stroller
                        : Icons.no_stroller,
                    color: myTheme.accentColor,
                    size: 25.0,
                  ),
                  title: Row(
                    children: [
                      Spacer(),
                      Text(
                        'babymode'.tr +
                            ':\n' +
                            (gameController.bebekmod == true
                                ? "open".tr
                                : "close".tr),
                        style: context.textThema.subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Spacer()
                    ],
                  ),
                  trailing: MergeSemantics(
                    child: CupertinoSwitch(
                      activeColor: Colors.green,
                      trackColor: Colors.red,
                      value: gameController.bebekmod,
                      onChanged: (bool value) {
                        gameController.bebekmodAcKapat();
                      },
                    ),
                  ),
                ),
              )),
          buildBuildLangCard(context),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.link,
                color: myTheme.accentColor,
              ),
              title: Text(
                'Refkles v1.0',
                style: context.textThema.subtitle1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildBuildLangCard(BuildContext context) {
    final GameController gameController = Get.find<GameController>();
    return Obx(() => Card(
          child: ListTile(
            leading: Icon(
              gameController.language == true ? Icons.language : Icons.language,
              color: myTheme.accentColor,
              size: 25.0,
            ),
            title: Row(
              children: [
                Spacer(),
                Text(
                  'languages'.tr +
                      ':\n' +
                      (gameController.language == false
                          ? Get.deviceLocale.toLanguageTag()
                          : "en-US"),
                  style: context.textThema.subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Spacer()
              ],
            ),
            trailing: MergeSemantics(
              child: CupertinoSwitch(
                activeColor: Colors.green,
                trackColor: Colors.red,
                value: gameController.language,
                onChanged: (bool value) {
                  gameController.languageDegistir();
                  var locale;
                  gameController.language == false
                      ? locale = Locale('tr', 'TR')
                      : locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                },
              ),
            ),
          ),
        ));
  }
}
