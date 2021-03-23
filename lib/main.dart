import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledoyun2/core/bindings/main_bindings.dart';
import 'package:ledoyun2/core/constant/ceviri.dart';
import 'package:ledoyun2/core/constant/theme.dart';
import 'package:ledoyun2/game_screen/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(), // your translations
      locale: Get.deviceLocale, // translations will be displayed in that locale
      fallbackLocale: Locale('en',
          'UK'), // specify the fallback locale in case an invalid locale is selected.

      debugShowCheckedModeBanner: false,
      initialBinding: MainBindings(),
      title: 'JavaScript game',
      theme: myTheme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GameScreen()),
      ],
    );
  }
}
