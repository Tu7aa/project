import 'package:flutter/material.dart';
import 'package:project/core/utils/styles.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {Key? key, required this.hintText, this.suffixIcon, this.onChanged, required this.text})
      : super(key: key);
  final String hintText;
  final IconButton? suffixIcon;
  Function(String)? onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (data){
          if (data!.isEmpty){
            return text;
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey)),
          hintText: hintText,
          hintStyle: TextStyle(color:kSecondaryColor ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
             ),
          suffixIcon: suffixIcon,
          suffixIconColor:kSecondaryColor,
          filled: true,
          fillColor:Colors.white,
        ),
      ),
    );
  }
}
