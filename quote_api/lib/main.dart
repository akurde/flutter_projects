import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_api/api_helper.dart';
import 'package:quote_api/bloc/quote_bloc.dart';
import 'package:quote_api/home_page.dart';
import 'package:quote_api/urls.dart';

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
      home: BlocProvider(
        create: (context) => QuoteBloc(apiHelper: ApiHelper()),
        child:HomePage(),
      )
    );
  }
}
