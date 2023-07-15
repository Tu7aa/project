import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/core/app_router.dart';
import 'package:project/core/utils/strings.dart';
import 'features/auth/mobile_login/presentation/view_model/mobile_auth/mobile_auth_cubit.dart';
import 'firebase_options.dart';

late String initialRoute ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = loginScreen;
    } else {
      initialRoute = mapScreen;
    }
  });
  runApp(MyApp(
    appRouter: AppRouter(mobileAuthCubit: MobileAuthCubit()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
