import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/utils/strings.dart';
import 'package:project/features/map/presentation/views/map_screen.dart';
import 'package:project/features/start_app/presentation/views/splash_screen.dart';
import '../features/auth/mobile_login/presentation/view_model/mobile_auth/mobile_auth_cubit.dart';

import '../features/auth/mobile_login/presentation/views/mobile_screen.dart';
import '../features/auth/mobile_login/presentation/views/otp_screen.dart';
import '../features/start_app/presentation/views/onboard.dart';

class AppRouter {
  MobileAuthCubit mobileAuthCubit;

  AppRouter({required this.mobileAuthCubit});

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingPage:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case mapScreen:
        return MaterialPageRoute(builder: (context) => MapScreen());
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MobileAuthCubit>.value(
            value: mobileAuthCubit,
            child: MobileScreen(),
          ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MobileAuthCubit>.value(
            value: mobileAuthCubit,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      default:
        return null;
    }
  }
}
