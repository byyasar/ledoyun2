import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/controllers/game_controller.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find<GameController>();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Tercihler',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Obx(() => Card(
                child: ListTile(
                  leading: Icon(
                    gameController.ses == true
                        ? Icons.volume_up
                        : Icons.volume_off,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  title: Row(
                    children: [
                      Spacer(),
                      Text(
                        'SES :\n' +
                            (gameController.ses == true ? "Açık" : "Kapalı"),
                        style: TextStyle(fontSize: 16),
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
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  title: Row(
                    children: [
                      Spacer(),
                      Text(
                        'BEBEK MODU :\n' +
                            (gameController.bebekmod == true
                                ? "Açık"
                                : "Kapalı"),
                        style: TextStyle(fontSize: 16),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Item 2'),
              onTap: () {
                gameController.sesAcKapat();
              },
            ),
          ),
        ],
      ),
    );
  }
}