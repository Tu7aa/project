import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/core/utils/colors.dart';

class PinCodeFields extends StatelessWidget {
  PinCodeFields({super.key, required this.otpCode});

  String otpCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        borderWidth: 1,
        activeColor: AppColors.blue,
        inactiveColor: AppColors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        selectedColor: AppColors.blue,
        selectedFillColor: Colors.white,
        fieldHeight: 50,
        fieldWidth: 40,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (code) {
        otpCode = code;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
