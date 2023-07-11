import 'package:flutter/material.dart';
import 'package:project/core/utils/colors.dart';

class PhoneNumberField extends StatelessWidget {
  PhoneNumberField({super.key});

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
      ),
    );
  }
}
