import 'package:flutter/material.dart';

import '../widgets/size_configs.dart';
import 'colors.dart';

class Styles {
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: "Klasik",
  );
  static const textStyle15 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      fontFamily: "Klasik",
      color: kSecondaryColor);
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Klasik",
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: "Klasik",
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: "Klasik",
  );
  static const textStyle25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontFamily: "montserrat",
  );
  static const textStyle30 = TextStyle(
      fontFamily: "montserrat",
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: AppColors.blue);
}

const Color kPrimaryColor = Color(0xffFC9D45);
const Color kSecondaryColor = Color(0xff573353);
const Color kScaffoldBackground = Color(0xffFFF3E9);

final kTitle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: kSecondaryColor,
);

final kTitle2 = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 6,
  color: kSecondaryColor,
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
);

final kBodyText2 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 3.8,
    fontWeight: FontWeight.normal);

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

final kInputHintStyle = kBodyText2.copyWith(
  fontWeight: FontWeight.normal,
  color: kSecondaryColor.withOpacity(0.5),
);
