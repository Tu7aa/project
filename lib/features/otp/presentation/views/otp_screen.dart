import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/phone_number_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  late String phoneNumber;

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: UniqueKey(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(),
                _PhoneNumberField(),
                const SizedBox(height: 50),
                _buildNextButton(),
              ],
            ),
          )),
    ));
  }



  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            maximumSize: Size(150, 60),
            primary: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: () {},
        child: const Text(
          'Next',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
  Widget _PhoneNumberField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(
              '${generateCountryFlag()}+20',
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 2,
          child: Container(

              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blue,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (value.length < 11) {
                    return 'Too short for phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
                decoration: InputDecoration(border: InputBorder.none),
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                autofocus: true,
                style: TextStyle(fontSize: 18, letterSpacing: 2.0),
              )),
        ),
      ],
    );
  }
  Widget _buildIntroTexts() {
    return Column(
      children: [
        const Text(
          'What is your phone number ?',
          style: TextStyle(
              color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: const Text(
            'Please enter your phone number to verify your account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}
