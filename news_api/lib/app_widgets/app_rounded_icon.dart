import 'package:flutter/material.dart';
import 'package:news_api/utils/util_helper.dart';

class AppRoundedIcon extends StatelessWidget{
  IconData? iconData;

  AppRoundedIcon({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        child: Center(
          child: Icon(iconData),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: AppColors.secondaryWhite.withOpacity(0.2)
          )
        ),
    );
  }
  
}