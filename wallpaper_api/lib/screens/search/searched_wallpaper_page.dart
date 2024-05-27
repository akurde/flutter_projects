import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_api/screens/search/cubit/search_cubit.dart';

class SearchedWallpaperPage extends StatefulWidget{
  String query;
  SearchedWallpaperPage({required this.query});

  @override
  State<SearchedWallpaperPage> createState() => _SearchedWallpaperPageState();
}

class _SearchedWallpaperPageState extends State<SearchedWallpaperPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SearchCubit>(context).getSearchWallpaper(query: widget.query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}