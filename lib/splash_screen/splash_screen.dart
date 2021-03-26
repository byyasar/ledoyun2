import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplahScreen extends StatefulWidget {
  @override
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed("/gameScreen");
      //Get.toNamed("/gameScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Expanded(
              child: Text(
            'Refleks Game',
            style: context.textTheme.headline4,
          )),
          Expanded(
              flex: 2,
              child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_icijjpda.json')),
          Spacer(),
        ],
      ),
    );
  }
}
