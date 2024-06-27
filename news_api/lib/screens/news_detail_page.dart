import 'package:flutter/material.dart';
import 'package:news_api/app_widgets/app_rounded_glossy_item.dart';
import 'package:news_api/app_widgets/app_rounded_icon.dart';
import 'package:news_api/data/repository/news_model.dart';
import 'package:news_api/utils/util_helper.dart';

class NewsDetailPage extends StatelessWidget{
  ArticleModel currNews;

  NewsDetailPage({required this.currNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
                shaderCallback: (rect){
                    return const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey, Colors.transparent]
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  currNews.urlToImage!,
                  height: MediaQuery.of(context).size.height*0.5,
                  fit:  BoxFit.fill,
                ),
              ),
          Container(
            padding: EdgeInsets.all(11),
            height: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                          AppRoundedGlossyItem(iconData: Icons.arrow_back_ios_sharp),
                          Expanded(child: Container()),
                          AppRoundedGlossyItem(iconData: Icons.link),
                          SizedBox(width: 8,),
                          AppRoundedGlossyItem(iconData: Icons.more_horiz),
                    ],
                  ),
                  SizedBox(
                      height: 100,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(21),
                      child: Column(
                        children: [
                           Text(currNews.title!, style: mTextStyle16(mFontWeight: FontWeight.bold),),
                           SizedBox(height: 11,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trending No.1', style: mTextStyle10(mColor: Colors.grey),),
                              Text('2 Days ago', style: mTextStyle10(mColor: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 11,),
                          Text(currNews.content ?? currNews.title!, style: mTextStyle12(mFontWeight: FontWeight.bold),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
            ),

          )
        ],
      ),
    );
  }
}