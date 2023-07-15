import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/core/utils/assets.dart';
import 'package:project/core/utils/strings.dart';
import 'package:project/core/utils/styles.dart';
import '../../../../../core/widgets/custom_material_btn.dart';
import '../../../../../core/widgets/custom_text_form.dart';
import '../../../../../core/widgets/size_configs.dart';
import '../../../../../core/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  final GlobalKey<FormState> _loginKey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text('Hi, Welcome Back! 👋', style: kTitle2),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 10),
                    child: Text('Email',
                        style: Styles.textStyle18
                            .copyWith(color: kSecondaryColor)),
                  ),
                ),
                CustomTextForm(
                  hintText: 'Please enter your email',
                  text: 'field is required',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: sizeV * 3,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 10),
                    child: Text('Password',
                        style: Styles.textStyle18
                            .copyWith(color: kSecondaryColor)),
                  ),
                ),
                CustomTextForm(
                  hintText: 'Please enter your Password',
                  text: 'field is required',
                  onChanged: (data) {
                    password = data;
                  },
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
                CustomMaterialButton(
                  text: 'Login',
                  onPressed: () async {
                    if (_loginKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.of(context).pushNamed(homeScreen);
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context, "already user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(
                  height: sizeV * 3,
                ),
                Text(
                  'Or with',
                  style:
                      Styles.textStyle18.copyWith(color: Colors.grey.shade600),
                ),
                SizedBox(
                  height: sizeV * 3,
                ),
                buildRow(sizeV),
                SizedBox(
                  height: sizeV * 3,
                ),
                Container(
                  width: sizeV * 20,
                  height: sizeV * 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(mobileScreen);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.phone,
                          width: 40,
                        ),
                        SizedBox(
                          width: sizeV * 2,
                        ),
                        Text('Phone', style: Styles.textStyle15)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeV * 6.5,
                ),
                buildNewMember(context)
              ],
            ),
          ),
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
              Navigator.of(context).pushNamed(registerScreen);
            },
            child: Text(
              'Register now',
              style: Styles.textStyle18
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
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
                  Text('Facebook', style: Styles.textStyle15)
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
              onPressed: () async {
                await signInWithGoogle();
              },
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.google,
                    width: 30,
                  ),
                  SizedBox(
                    width: sizeV * 2,
                  ),
                  Text('Google', style: Styles.textStyle15)
                ],
              ),
            ),
          ),
        ),
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

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
