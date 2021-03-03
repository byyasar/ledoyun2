import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/core/extension/bindings/main_bindings.dart';
import 'package:ledoyun2/game_screen/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      title: 'Flutter game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GameScreen()),
      ],
    );
  }
}
