import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/core/utils/strings.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), navigator);
  }

  void navigator() {
    Navigator.of(context).pushReplacementNamed(onBoardingPage);
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppAssets.logo,
              width: width * .7,
            ),
          )
        ],
      ),
    );
  }
}
