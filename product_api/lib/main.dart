import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'package:product_api/product_data_model.dart';

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
        title: Text("Product API"),
      ),
      body: FutureBuilder(future: getProduct(), builder: (_, snap){
        if(snap.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        } else if(snap.hasError){
          return Center(child: Text('Error: ${snap.error}'),);
        } else if(snap.hasData){
          return snap.data != null ? snap.data!.products!.isNotEmpty ? 
                ListView.builder(
                  itemCount: snap.data!.products!.length,
                  itemBuilder: (_, index){
                    Products eachProductData = snap.data!.products![index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(eachProductData.thumbnail!),
                        ),
                        title: Text('${eachProductData.title!}'),
                        subtitle: Text('${eachProductData.description!}'),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: eachProductData!.images!.length,
                          itemBuilder: (_, childIndex){
                            String eachProductImgUrl = eachProductData.images![childIndex];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Image.network(eachProductImgUrl, height: 50, fit: BoxFit.fill,)
                              ),
                            );
                        }),
                      )
                    ],
                  );
                }) : Center(child: Text('No Product found')) 
                   : Center(child: Text('No Product found!!'));
        }
        return Container();
      }
      )
    );
  }
  
  Future<ProductDataModel?> getProduct() async {
    ProductDataModel? productData;
    String url = "https://dummyjson.com/products";
    var response = await httpClient.get(Uri.parse(url));

    if(response.statusCode == 200){
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);

      productData = ProductDataModel.fromJson(rawData);
      
    } 
    return productData;
  }

}
