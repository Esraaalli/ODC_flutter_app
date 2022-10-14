
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/business_logic/auth/register/register_model.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());


  static RegisterCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;
  RegisterModel? model;
  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility
  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  String gender = 'm';
  void changeGender(value){
    gender = value;
    emit(ChangeGenderState());
  }

  Future postRegister(
      {required String name,
        required String email,
        required String password,
        required String phoneNumber,
        required String gender,
        context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) {
      if (value.statusCode == 200) {
        model=RegisterModel.fromJson(value.data);
        
        emit(RegisterSuccessState(model!));
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}
