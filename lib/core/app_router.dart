

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/features/otp/presentation/views/otp_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) =>  OtpScreen());
    }
  }
}
