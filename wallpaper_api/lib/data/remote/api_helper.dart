import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as httpclient;
import 'package:wallpaper_api/data/remote/app_exception.dart';
import 'package:wallpaper_api/model/wallpaper_model.dart';
 
class ApiHelper{
  Future<dynamic> getAPI({required String url}) async {
      var uri = Uri.parse(url);

      try{
        var res = await httpclient.get(uri, headers: {
          "Authorization": "Iybr0n2erxR8vBVWQF8lAKlvsaB7MwtAIPUAPca3HOlZRu9WdHbqwZT2"
        });
        var res1 = returnJsonResponse(res);
        return res1;
      } on SocketException catch (e){
        throw (FetchDataException(errorMsg:"No Internet!!"));
      }

  }
  
  dynamic returnJsonResponse(httpclient.Response response) {
    switch(response.statusCode){
      case 200:
          {
            dynamic mData = jsonDecode(response.body);
            return mData;
          }
      case 400:
          throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
          throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
          default:
            throw FetchDataException(errorMsg: 'Error occurred while Communication with Server' );
    }
  }
}