import 'package:flutter/material.dart';
import 'package:project/core/utils/strings.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/onboard_nav_btn.dart';
import '../../../../core/widgets/size_configs.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../auth/mobile_login/presentation/views/mobile_screen.dart';
import '../../../auth/sign_in/presentation/views/login_screen.dart';
import '../../data/model/onboard_data.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingContents.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      Text(
                        onboardingContents[index].title,
                        style: kTitle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      SizedBox(
                        height: sizeV * 50,
                        child: Image.asset(
                          onboardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: kBodyText1,
                          children: const [
                            TextSpan(text: 'WE CAN '),
                            TextSpan(
                                text: 'HELP YOU ',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                )),
                            TextSpan(text: 'TO FIND '),
                            TextSpan(text: 'NEARBY '),
                            TextSpan(
                              text: 'RESTAURANTS ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                        ? MyTextButton(
                      buttonName: 'Get Started',
                      onPressed: () {
                       Navigator.of(context).pushReplacementNamed(loginScreen);
                      },
                      bgColor: kPrimaryColor,
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OnBoardNavBtn(
                          name: 'Skip',
                          onPressed: () {
                                Navigator.of(context).pushReplacementNamed(loginScreen);
                          },
                        ),
                        Row(
                          children: List.generate(
                            onboardingContents.length,
                                (index) => dotIndicator(index),
                          ),
                        ),
                        OnBoardNavBtn(
                          name: 'Next',
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}