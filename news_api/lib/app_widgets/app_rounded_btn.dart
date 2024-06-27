import 'package:flutter/material.dart';
import 'package:news_api/utils/util_helper.dart';

class AppRoundedBtn extends StatelessWidget{
  String title;
  VoidCallback onTap;
  AppRoundedBtn({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onTap, 
          child: Text(
                title, style: mTextStyle16(mColor: Colors.white),
            ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34)
            )
          ),
        )
      );
  }
  
}