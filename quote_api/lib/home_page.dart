import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_api/bloc/quote_bloc.dart';
import 'package:quote_api/bloc/quote_event.dart';
import 'package:quote_api/bloc/quote_state.dart';
import 'package:quote_api/quote_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DataModel? mQuotes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<QuoteBloc>(context).add(GetQuotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quote API'),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state){
          if(state is QuoteLoadingState){
            return Center(child: CircularProgressIndicator(),);
          } else if(state is QuoteErrorState){
              return Center(child: Text('${state.errMsg}'));
          } else if(state is QuoteLoadedState){
              var mDataModel = state.resData;
              return ListView.builder(
                itemCount: mDataModel.quotes.length,
                itemBuilder: (_, index){
                    var eachQuote = mDataModel.quotes[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text('${eachQuote.quote}'),
                          subtitle: Text(eachQuote.author),
                        ),
                      ),
                    );
                }
              );
          }
            return Container();
        },
      ),
      // Center(
      //   child: mQuotes != null ? mQuotes!.quotes!.isNotEmpty ? 
      //     ListView.builder(
      //       itemCount: mQuotes!.quotes!.length,
      //       itemBuilder: (_, index){
      //         return ListTile(
      //           title: Text('${mQuotes!.quotes[index].quote}'),
      //           subtitle: Text('${mQuotes!.quotes[index].author}'),
      //         );
      //       }) : Text('No Quotes found!') 
      //          : CircularProgressIndicator()
      // ),
    );
  }
}