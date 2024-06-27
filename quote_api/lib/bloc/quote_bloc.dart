import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_api/api_helper.dart';
import 'package:quote_api/app_exception.dart';
import 'package:quote_api/bloc/quote_event.dart';
import 'package:quote_api/bloc/quote_state.dart';
import 'package:quote_api/quote_model.dart';
import 'package:quote_api/urls.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  ApiHelper apiHelper;
    QuoteBloc({required this.apiHelper}) : super(QuoteInitialState()){
      on<GetQuotesEvent>((event, emit) async{
          emit(QuoteLoadingState());
          try{
              var resJson = await apiHelper.getQuotes(url: Urls.quoteUrl);
              if(resJson != null){
                var mResData = DataModel.fromJson(resJson);
                emit(QuoteLoadedState(resData: mResData));
              } else {
                emit(QuoteErrorState(errMsg: "Error occured!!"));
              }
          } catch(e){
              emit(QuoteErrorState(errMsg: "${(e as AppException).toErrorMsg()}"));
          }
      });
    }
}