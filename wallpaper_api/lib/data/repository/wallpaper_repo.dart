import 'package:wallpaper_api/data/remote/api_helper.dart';
import 'package:wallpaper_api/data/remote/urls.dart';

class WallpaperRepository {
  ApiHelper apiHelper;

  WallpaperRepository({required this.apiHelper});

  Future<dynamic> getSearchWallpaper(String mQuery) async{
      try{
        return apiHelper.getAPI(url: '${AppUrls.SEARCH_WALLPAPER_URL}?query=$mQuery');
      } catch(e){
          throw(e);
      }

  }

  Future<dynamic> getTrendingWallpaper() async{
      try{
        return apiHelper.getAPI(url: AppUrls.TRENDING_WALLPAPER_URL);
      } catch(e){
          throw(e);
      }

  }
}