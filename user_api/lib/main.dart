import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpclient;
import 'package:user_api/user_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('User API'),
      ),
      body: FutureBuilder(
        future: getUsersData(), 
        builder: (_, snap){
          if(snap.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else if(snap.hasError){
            return Center(child: Text('${snap.error}'),);
          } else if(snap.hasData){
              return snap.data != null ? ListView.builder(
                itemCount: snap.data!.users!.length,
                itemBuilder: (_, index){

                    UserModel eachUser = snap.data!.users![index];

                  return snap.data!.users != null ? ListTile(
                    leading: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(eachUser.image!),
                        ),
                        Text(eachUser.userName!= null ? eachUser.userName! : ""),
                      ],
                    ),
                    title: Text(eachUser.firstName! + eachUser.lastName!),
                    subtitle: Text(eachUser.email!),
                  ) : Text('No Users Found');
                }
              ) : Text('No Data Found');
          }
          return Container();
        }
      )
    );
  }

  Future<UserDataModel?> getUsersData() async{

      UserDataModel? userData;
      String url = "https://dummyjson.com/users";
      var response = await httpclient.get(Uri.parse(url));

      if(response.statusCode == 200){
        var mData = response.body;
        var rawData = jsonDecode(mData);

        userData = UserDataModel.fromJson(rawData);
      }

      return userData;
  }
}
