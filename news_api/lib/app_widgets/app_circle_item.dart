import 'package:flutter/material.dart';
import 'package:news_api/utils/util_helper.dart';

class AppCircleItem extends StatelessWidget{

  String imgUrl;
  String title;


  AppCircleItem({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: Center(child: Text(title, style: mTextStyle16(),),),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber
          // image: DecorationImage(
          //   image: NetworkImage(imgUrl),
          //   fit: BoxFit.fill
          // )
        ),
    );
  }
    
}