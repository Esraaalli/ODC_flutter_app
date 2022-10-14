import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/lectures/lectures_state.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';
import '../../../data/models/lectures_model.dart';

class LecturesCubit extends Cubit<LecturesStates> {
  LecturesCubit() : super(LecturesInitialState());

  static LecturesCubit get(context) => BlocProvider.of(context);

  List<LecturesModel> data = [];

  Future getLectures(String token) async {
    emit(LecturesLoadingState());
    DioHelper.getData(url: lectureEndPoint, token: token).then((value) {
      List l = jsonDecode(value.toString())['data'] as List;
      data = l.map((lecture) => LecturesModel.fromJson(lecture)).toList();
      emit(LecturesSuccessState(lecturesList: data));
    }).catchError((error) {
      if (kDebugMode) {
        print("ERROR IS: ${error.toString()}");
      }
      emit(LecturesErrorState());
    });
  }
}
