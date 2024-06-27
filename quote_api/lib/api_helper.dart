import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'package:quote_api/app_exception.dart';

class ApiHelper{
  String? url;
  ApiHelper({this.url});

  Future<dynamic> getQuotes({url}) async{

    try{
        var response = await httpClient.get(Uri.parse(url));
        return returnJsonResponse(response);
        // if(response.statusCode == 200){
        //   var rawData = response.body;
        //   print(rawData);

        //   var mData = jsonDecode(rawData);  
        //   return mData;
          
        // } else {
        //   return null;
        // }
    } on SocketException catch(e){
        throw FetchDataException(errorMsg: "No Internet!");
    }
  }

  Future<dynamic> postAPI({required String url, Map<String, dynamic>? bodyparam}) async{

    try{
        var uri = Uri.parse(url);
        var response = await httpClient.post(uri, body: bodyparam ?? {});

        return returnJsonResponse(response);
        // if(response.statusCode == 200){
        //       var rawData = response.body;
        //       print(rawData);

        //       var mData = jsonDecode(rawData);  
        //       return mData;
              
        //     } else {
        //       return null;
        //     }
        
      } on SocketException catch(e){
          throw FetchDataException(errorMsg: "No Internet!");
      } 
  }

  dynamic returnJsonResponse(httpClient.Response response){
      switch (response.statusCode) {
        case 200:
            var mData = jsonDecode(response.body);
            return mData;
        //case 300:
        case 400:
            throw BadRequestException(errorMsg: response.body.toString());
        case 401:
        case 403:
            throw UnauthorisedException(errorMsg: response.body.toString());
        case 500:
        default:
            throw FetchDataException(errorMsg: 'Error occurred while Communication with Server with statuscode: ${response.statusCode} ' );
        }
  }
}