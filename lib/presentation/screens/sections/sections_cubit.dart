import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/sections/sections_state.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';
import '../../../data/models/sections_model.dart';

class SectionCubit extends Cubit<SectionStates> {
  SectionCubit() : super(SectionInitialState());

  static SectionCubit get(context) => BlocProvider.of(context);

  List<SectionsModel> data = [];

  Future getSections(String token) async {
    emit(SectionLoadingState());

    DioHelper.getData(url: sectionEndPoint, token: token).then((value) {
      List l = jsonDecode(value.toString())['data'] as List;
      data = l.map((section) => SectionsModel.fromJson(section)).toList();
      emit(SectionSuccessState(sectionsList: data));
    }).catchError((error) {
      if (kDebugMode) {
        print("ERROR IS: ${error.toString()}");
      }
      emit(SectionErrorState());
    });
  }
}
