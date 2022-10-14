import 'package:odc_app/data/models/lectures_model.dart';

abstract class LecturesStates {}

class LecturesInitialState extends LecturesStates {}

class LecturesSuccessState extends LecturesStates 
{
  List<LecturesModel> lecturesList;

  LecturesSuccessState({required this.lecturesList});
}

class LecturesErrorState extends LecturesStates {}

class LecturesLoadingState extends LecturesStates {}