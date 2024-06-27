
import 'package:flutter/material.dart';

class AppColors{
  static Color mainBlack = Color(0xff101010);
  static Color secondaryBlack = Color(0xff1f2023);
  static Color greyBlack = Color(0xff424040);

  static Color mainWhite = Color(0xffF8F8F8);
  static Color secondaryWhite = Color(0xffA4A5A7);

  static Color mainColor = Color(0xff3380EF);
}

TextStyle mTextStyle10(
      {Color mColor = Colors.black, 
        mFontWeight = FontWeight.normal }){
  return TextStyle(
    fontSize: 10,
    color: mColor,
    fontWeight: mFontWeight,
    fontFamily: 'fontMain'
  );
}


TextStyle mTextStyle12(
      {Color mColor = Colors.black, 
        mFontWeight = FontWeight.normal }){
  return TextStyle(
    fontSize: 12,
    color: mColor,
    fontWeight: mFontWeight,
    fontFamily: 'fontMain'
  );
}

TextStyle mTextStyle16({Color mColor = Colors.black, mFontWeight = FontWeight.normal }){
  return TextStyle(
    fontSize: 16,
    color: mColor,
    fontWeight: mFontWeight,
    fontFamily: 'fontMain'
  );
}

TextStyle mTextStyle22({Color mColor = Colors.black, mFontWeight = FontWeight.normal }){
  return TextStyle(
    fontSize: 22,
    color: mColor,
    fontWeight: mFontWeight,
    fontFamily: 'fontMain'
  );
}