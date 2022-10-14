
import 'login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates 
{
  final LoginModel model;

  LoginSuccessState({required this.model});
}

class LoginErrorState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class VisiblePasswordState extends LoginStates {}



