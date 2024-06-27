import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:news_api/app_widgets/app_rounded_btn.dart';
import 'package:news_api/screens/home_page.dart';
import 'package:news_api/utils/util_helper.dart';

class InitialPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OnBoardingSlider(
                  controllerColor: Colors.blue,
                  indicatorAbove: true,
                  hasFloatingButton: false,
                  totalPage: 3, 
                  headerBackgroundColor: Colors.white, 
                  background: [
                    Container(),
                    Container(),
                    Container()
                  ], 
                  speed: 10, 
                pageBodies: getSliderPages()),
              ),
              AppRoundedBtn(
                title: "Sign Up With Email", 
                onTap: (){
                  // Navigate to Login page
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => HomePage()
                  ));
                }
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: mTextStyle10(mColor: Colors.grey)),
                  Text("Sign In", style: mTextStyle12(mColor: Colors.blue)),
                ],
              ),
            ],
          ),
        ),

    );
  }
  
  List<Widget> getSliderPages(){
      List<Widget> listPage = [];

      listPage.add(getPage());
      listPage.add(getPage());
      listPage.add(getPage());

      return listPage;
  }

  Widget getPage({
    String imgPath = "asset/images/slider_one.png",
    String title = "Get The Latest And Updated News\n News Easily With Us",
    String desc = "Get The Latest Updats On Most\n Popular And Hot News With Us"
  }){
    return Container(
      padding: EdgeInsets.only(bottom: 11),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Image.asset(imgPath),
            ),
          ),
          SizedBox(height: 11,),
          Text(
            title, 
            style: mTextStyle22(),
            textAlign: TextAlign.center,),
          SizedBox(height: 11,),
          Text(desc, style: mTextStyle16(mColor: Colors.grey),),
        ],
      ),
    );
  }
}