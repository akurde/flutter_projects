import 'package:flutter/material.dart';
import 'package:news_api/app_widgets/app_circle_item.dart';
import 'package:news_api/app_widgets/app_headline_widget.dart';
import 'package:news_api/app_widgets/app_rounded_btn.dart';
import 'package:news_api/app_widgets/app_rounded_icon.dart';
import 'package:news_api/data/remote/api_helper.dart';
import 'package:news_api/data/remote/urls.dart';
import 'package:news_api/data/repository/news_model.dart';
import 'package:news_api/utils/app_constant.dart';
import 'package:news_api/utils/util_helper.dart';

class HomePage extends StatefulWidget{
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  void initState() {
    super.initState();
    getTopHeadlines();
  }

  Future<NewsModel> getTopHeadlines() async{
    var data = await ApiHelper().getAPI(url: "${AppUrls.ENDPOINT_EVERYTHING_URL}?q=bitcoin&apiKey=${AppUrls.API_KEY}");
    NewsModel newsModel = NewsModel.fromJson(data as Map<String, dynamic>);
    return newsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Row(
                children: [
                  AppRoundedIcon(iconData: Icons.menu),
                  Expanded(child: Container()),
                  AppRoundedIcon(iconData: Icons.notifications_active_outlined),
                  SizedBox(width: 8,),
                  AppRoundedIcon(iconData: Icons.search),
                  SizedBox(width: 8,),
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainColor,
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hotest News', style: mTextStyle22(mFontWeight: FontWeight.bold),),
                  Text('see more', style: mTextStyle16(mColor: Colors.grey),),
                ],
              ),
              SizedBox(height: 11,),
              FutureBuilder(
                future: getTopHeadlines(), 
                builder: (_, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  } else if(snapshot.hasError){
                    return Center(child: Text('${snapshot.error}'),);
                  }
                  if(snapshot.hasData){
                    return snapshot.data!.articles!.isNotEmpty ? 
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (_, index){
                          var eachArticle = snapshot.data!.articles![index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: AppHeadlineWidget(
                                        imgUrl: eachArticle.urlToImage!, 
                                        headline: eachArticle.title!, 
                                        author: eachArticle.author! ?? "",
                                      ),
                            );
                        }
                      ),
                    ) : Center(child: Text("No Headlines right now!!"));
                  }
                  return Container();
                }
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Explore', style: mTextStyle22(mFontWeight: FontWeight.bold),),
                  Text('see more', style: mTextStyle12(mColor: Colors.grey),),
                ],
              ),
              SizedBox(height: 11,),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: AppConstant.mData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index){
                      var eachArticle = AppConstant.mData[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: AppCircleItem(
                          imgUrl: eachArticle["img"], 
                          title: eachArticle["title"]
                        )
                      );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}