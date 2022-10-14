// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

// ignore: must_be_immutable
class RegisterSuccessState extends RegisterState {
  late RegisterModel model;
  RegisterSuccessState(
     this.model,
  );
}

class RegisterErrorState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class VisiblePasswordState extends RegisterState {}

class VisibleConfirmPasswordState extends RegisterState {}

class ChangeGenderState extends RegisterState {}
