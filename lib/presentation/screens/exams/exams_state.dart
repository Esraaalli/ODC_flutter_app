import '../../../data/models/exams_model.dart';

abstract class ExamsStates {}

class ExamsInitialState extends ExamsStates {}

class ExamsSuccessState extends ExamsStates 
{
  List<ExamsModel> examsList;

  ExamsSuccessState({required this.examsList});
}

class ExamsErrorState extends ExamsStates {}

class ExamsLoadingState extends ExamsStates {}