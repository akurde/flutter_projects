import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_api/model/wallpaper_model.dart';
import 'package:wallpaper_api/utils/utils_helper.dart';

class DetailWallpaperPage extends StatelessWidget{
  Src imgModel;
  DetailWallpaperPage({required this.imgModel}); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(imgModel.potrait!, fit: BoxFit.cover,)
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      getActionBtn(onTap: (){
                
                      }, title: "Info", icon: Icons.info_outline),
                      SizedBox(width: 25,),
                      getActionBtn(onTap: saveWallpaper, title: "Save", icon: Icons.download),
                      SizedBox(width: 25,),
                      getActionBtn(onTap: applyWallpaper, title: "Apply", icon: Icons.format_paint, bgColor: Colors.blueAccent),
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getActionBtn({required VoidCallback onTap, required String title, required IconData icon, Color? bgColor}){
      return Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: bgColor != null ? Colors.blueAccent :Colors.white.withOpacity(0.4),
            ),
            child: Center(child: Icon(icon, size: 34,)),
          ),
          SizedBox(height: 2,),
          Text(title, style: mTextStyle12(mColor: Colors.white),),
        ],
      );
  }
  
}

void saveWallpaper(){

}

void applyWallpaper(){

}