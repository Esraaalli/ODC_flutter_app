import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/settings/terms_conditions/terms_State.dart';
import '../../../../constants/end_points.dart';
import '../../../../data provider/remote/dio_helper.dart';
import '../../../../data/models/terms_Model.dart';


class TermsCubit extends Cubit<TermsStates>
{
  TermsCubit() : super(TermsIntialState());

  static TermsCubit get(BuildContext context)=> BlocProvider.of(context);
  TermModel? termModel;
  void getTerms(String token)
  {
    DioHelper.getData(url: termsEndPoint,token: token).then((value) {
      termModel=TermModel.fromJson(value.data);
      print(value.statusCode);
      emit(TermsStoredData());
    });
  }

}