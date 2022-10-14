import '../../../data/models/sections_model.dart';

abstract class SectionStates {}

class SectionInitialState extends SectionStates {}

class SectionSuccessState extends SectionStates 
{
  List<SectionsModel> sectionsList;

  SectionSuccessState({required this.sectionsList});
}

class SectionErrorState extends SectionStates {}

class SectionLoadingState extends SectionStates {}