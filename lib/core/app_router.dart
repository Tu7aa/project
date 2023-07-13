import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/utils/strings.dart';
import 'package:project/features/login/presentation/view_model/mobile_auth/mobile_auth_cubit.dart';
import 'package:project/features/login/presentation/views/otp_screen.dart';
import 'package:project/features/map/presentation/views/map_screen.dart';
import '../features/login/presentation/views/login_screen.dart';

class AppRouter {
  MobileAuthCubit mobileAuthCubit;

  AppRouter({required this.mobileAuthCubit});

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(builder: (context) => const MapScreen());
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MobileAuthCubit>.value(
            value: mobileAuthCubit,
            child: LoginScreen(),
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
