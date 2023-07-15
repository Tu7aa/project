import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/core/utils/colors.dart';

import '../../../../../core/utils/strings.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/size_configs.dart';
import '../view_model/mobile_auth/mobile_auth_cubit.dart';


// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber;

  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  late String otpCode;

  Widget _buildIntroTexts() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Verify your phone number',
          style: kTitle2,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style: kBodyText2,
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumber',
                  style: kBodyText2.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: AppColors.blue,
          inactiveColor: AppColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: AppColors.lightBlue,
          selectedColor: AppColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<MobileAuthCubit>(context).submitOTP(otpCode);
  }

  Widget _buildVrifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);

          _login(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110, 50),
          primary: kSecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'Klasik'),
        ),
      ),
    );
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<MobileAuthCubit, MobileAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is MobileAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is MobileAuthOTPVerified) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(mapScreen);
        }

        if (state is MobileAuthFailure) {
          String errorMsg = (state).errMess;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            children: [
              _buildIntroTexts(),
              SizedBox(
                height: 88,
              ),
              _buildPinCodeFields(context),
              SizedBox(
                height: 60,
              ),
              _buildVrifyButton(context),
              _buildPhoneVerificationBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
