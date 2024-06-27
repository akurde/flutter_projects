import 'package:flutter/material.dart';
import 'package:news_api/utils/util_helper.dart';

class AppHeadlineWidget extends StatelessWidget{
    String imgUrl;
    String headline;
    String author;
  AppHeadlineWidget({
    required this.imgUrl, 
    required this.headline, 
    required this.author
  });

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 400,
        height: 450,
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
              Expanded(child: ClipRRect(
                borderRadius: BorderRadius.circular(34),
                child: Image.network(imgUrl, fit: BoxFit.fill,height: double.infinity,))
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending No.1', style: mTextStyle16(mColor: Colors.grey),),
                  Text('2 Days ago', style: mTextStyle12(mColor: Colors.grey),),
                ],
              ),
              SizedBox(height: 11,),
              Text(headline, style: mTextStyle16(mFontWeight: FontWeight.bold),),
              SizedBox(height: 11,),
              Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainColor,
                    ),
                    SizedBox(width: 11,),
                    Text(author, style: mTextStyle12(mColor: Colors.grey),),
                    Expanded(child: Container()),
                    Icon(Icons.more_horiz)
                  ],
                ),  
              SizedBox(height: 11,),
          ] 
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(34)
        ),
      );
  }

}