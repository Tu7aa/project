import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/utils/strings.dart';
import '../../../auth/mobile_login/presentation/view_model/mobile_auth/mobile_auth_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MobileAuthCubit mobileAuthCubit = MobileAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: BlocProvider<MobileAuthCubit>(
              create: (context) => MobileAuthCubit(),
              child: ElevatedButton(
                onPressed: () async {
                  await mobileAuthCubit.logOut();
                  Navigator.pushReplacementNamed(context, loginScreen);
                },
                child: const Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
