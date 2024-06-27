import 'package:quote_api/quote_model.dart';

abstract class QuoteState{}

class QuoteInitialState extends QuoteState{}

class QuoteLoadingState extends QuoteState{}

class QuoteLoadedState extends QuoteState{
  DataModel resData;
  QuoteLoadedState({required this.resData});

}

class QuoteErrorState extends QuoteState{
  String errMsg;
  QuoteErrorState({required this.errMsg});
}