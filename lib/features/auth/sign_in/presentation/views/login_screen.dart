import 'package:flutter/material.dart';
import 'package:project/core/utils/assets.dart';
import 'package:project/core/utils/styles.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_material_btn.dart';
import '../../../../../core/widgets/custom_text_form.dart';
import '../../../../../core/widgets/size_configs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text('Hi, Welcome Back! 👋', style: kTitle2),
              ),
            ),
            SizedBox(
              height: sizeV * 3,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: Text('Email',
                    style: Styles.textStyle18.copyWith(color: kSecondaryColor)),
              ),
            ),
            CustomTextForm(
              hintText: 'Please enter your email',
              text: 'field is required',
            ),
            SizedBox(
              height: sizeV * 3,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: Text('Password',
                    style: Styles.textStyle18.copyWith(color: kSecondaryColor)),
              ),
            ),
            CustomTextForm(
              hintText: 'Please enter your Password',
              text: 'field is required',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: isObscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            buildPadding(),
            SizedBox(
              height: sizeV * 3,
            ),
            const CustomMaterialButton(
              text: 'Login',
            ),
            SizedBox(
              height: sizeV * 3,
            ),
            Text(
              'Or with',
              style: Styles.textStyle18.copyWith(color: Colors.grey.shade600),
            ),
            SizedBox(
              height: sizeV * 3,
            ),
            buildRow(sizeV),
            SizedBox(
              height: sizeV *17 ,
            ),
            buildNewMember(context)
          ],
        ),
      ),
    );
  }

  Row buildNewMember(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Member?',
                style: Styles.textStyle20.copyWith(color: kSecondaryColor),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'RegisterPage');
                  },
                  child: Text(
                    'Register now',
                    style: Styles.textStyle18.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ))
            ],
          );
  }

  Row buildRow(double sizeV) {
    return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: sizeV * 20,
                  height: sizeV * 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.facebook,
                          width: 30,
                        ),
                        SizedBox(
                          width: sizeV * 2,
                        ),
                        Text(
                          'Facebook',
                          style:Styles.textStyle15
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: sizeV * 20,
                  height: sizeV * 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.google,
                          width: 30,
                        ),
                        SizedBox(
                          width: sizeV * 2,
                        ),
                        Text(
                            'Google',
                            style:Styles.textStyle15
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Forget password?",
              style: Styles.textStyle15.copyWith(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
