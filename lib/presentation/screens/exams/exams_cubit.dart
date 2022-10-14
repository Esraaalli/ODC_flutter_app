import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';
import '../../../data/models/exams_model.dart';
import 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsStates> {
  ExamsCubit() : super(ExamsInitialState());

  static ExamsCubit get(context) => BlocProvider.of(context);

  List<ExamsModel> data = [];

  Future getExams(String token) async {
    emit(ExamsLoadingState());

    DioHelper.getData(url: examsEndPoint, token: token).then((value) {
      
      List l = jsonDecode(value.toString())['data'] as List;
      data = l.map((exam) => ExamsModel.fromJson(exam)).toList();
      emit(ExamsSuccessState(examsList: data));
    }).catchError((error) {
      if (kDebugMode) {
        print("ERROR IS: ${error.toString()}");
      }
      emit(ExamsErrorState());
    });
  }
}
