import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_api/app_widget/wallpaper_bg_widget.dart';
import 'package:wallpaper_api/model/wallpaper_model.dart';
import 'package:wallpaper_api/screens/detail_wallpaper_page.dart';
import 'package:wallpaper_api/screens/search/cubit/search_cubit.dart';
import 'package:wallpaper_api/screens/search/cubit/search_state.dart';
import 'package:wallpaper_api/utils/utils_helper.dart';

class SearchedWallpaperPage extends StatefulWidget{
  String query;
  String color;
  SearchedWallpaperPage({required this.query, this.color = ""});

  @override
  State<SearchedWallpaperPage> createState() => _SearchedWallpaperPageState();
}

class _SearchedWallpaperPageState extends State<SearchedWallpaperPage> {
  ScrollController? scrollController;
  int totalWallpaperCount = 0;
  num totalNoPages = 1;
  int pageCount = 1;

  List<Photo> allWallpapers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController!.addListener((){
      if(scrollController!.position.pixels == scrollController!.position.maxScrollExtent){
          print("End of list");
          totalNoPages = totalWallpaperCount~/15 + 1;
          if(totalNoPages>pageCount){
              pageCount++;
              BlocProvider.of<SearchCubit>(context).getSearchWallpaper(query: widget.query, color: widget.color, page: pageCount);
          } else {
              print('You\'ve reached the end of this category wallpapers!');
          }
      }
    });
    BlocProvider.of<SearchCubit>(context).getSearchWallpaper(query: widget.query, color: widget.color, page: pageCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      // appBar: AppBar(),
      body: BlocListener<SearchCubit, SearchState>(
        listener: (_, state){
          if(state is SearchLoadingState){
              // return Center(child: CircularProgressIndicator(),);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pageCount != 1 ? "Next Page Loading.." : "Loading..")));
          } else if(state is SearchErrorState){
              // return Center(child: Text('${state.errorMsg}'),);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          } else if(state is SearchLoadedState){
              totalWallpaperCount = state.totalWallpapers;
              allWallpapers.addAll(state.listPhotos);
              setState(() {
                
              });
          }
        },
        child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                // ListView( We can use ListView as well instead of column to scroll whole page for that we have to enable physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 40,),
                    Text(widget.query, style: mTextStyle25(mFontWeight: FontWeight.w900),),
                    SizedBox(height: 11,),
                    Text('${totalWallpaperCount} Wallpaper available', style: mTextStyle14(),),
                    SizedBox(height: 21,),
                    Expanded(child: Container(
                      // child : NotificationListener<ScrollNotification>(
                      //   onNotification: (ScrollNotification notification){
                      //     // if(notification.metrics.pixels == notification.metrics.maxScrollExtent){

                      //     // }
                      //     if(notification is ScrollStartNotification){

                      //     }
                      //     return false;  
                      //   },
                      child:GridView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                         //physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 11,
                            crossAxisSpacing: 11,
                            childAspectRatio: 3/4,
                        ), 
                        itemCount: allWallpapers.length,
                        itemBuilder: (_,index){
                          var eachPhotos = allWallpapers[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: index == allWallpapers.length - 1 ? 11 : 0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWallpaperPage(imgModel: eachPhotos.src!,)));
                              },
                              child: WallpaperBgWidget(imgUrl: eachPhotos.src!.potrait!)
                            ),
                          );
                        }
                      ),
                    ))
                  ],
                ),
              ),
      ),
    );
  }
}