
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';



class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*0.85,
      height:  MediaQuery.of(context).size.height*.076,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color:kSecondaryColor),
      child: MaterialButton(
          onPressed:onPressed,
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(color: const Color(0xffFCFCFC)),
          )),
    );
  }
}
