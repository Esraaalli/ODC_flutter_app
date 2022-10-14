import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/data/models/news_model.dart';
import 'package:odc_app/presentation/screens/news/news_state.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<NewsModel> data = [];

  void getNews({
    required String token,
  }) {
    emit(NewsLoading());
    DioHelper.getData(
      url: newsEndPoint,
      token: token,
    ).then((value) {
      if (value.statusCode == 200) {
        emit(NewsLoading());
        List<NewsModel> newsList;
        List l = jsonDecode(value.toString())['data'] as List;
        newsList = l.map((news) => NewsModel.fromJson(news)).toList();
        print("IMAGE ID IS: ${newsList[0].imageUrl}");
        emit(NewsLoaded(newsList: newsList));
      }
    }).catchError((error) {
      if (kDebugMode) print(error);
      emit(NewsError());
    });
  }
}
