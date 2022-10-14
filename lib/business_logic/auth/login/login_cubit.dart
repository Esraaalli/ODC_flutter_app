import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/end_points.dart';
import '../../../data provider/remote/dio_helper.dart';
import 'login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  String? token;
  bool visiblePassword = false;
  late LoginModel model;

  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility

  Future postLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value) {
      if (value.statusCode == 200) {
        model = LoginModel.fromJson(value.data);
        token = value.data['data']['accessToken'];
        print(token);
        emit(LoginSuccessState(model: model));
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginErrorState());
    });
  }
}
