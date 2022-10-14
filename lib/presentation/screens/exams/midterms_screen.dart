import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/sections/sections_cubit.dart';
import 'package:odc_app/presentation/screens/sections/sections_state.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/exams_model.dart';
import '../../../data/models/sections_model.dart';
import '../../../views/lecture_card_item.dart';
import 'exams_cubit.dart';
import 'exams_state.dart';

// ignore: must_be_immutable
class MidtermsScreen extends StatelessWidget {
   MidtermsScreen({Key? key}) : super(key: key);

 
  late ExamsCubit examsCubit;
  List<ExamsModel> midtermsList = [
    ExamsModel(examSubject: "Java", examDate: "2022-06-05", examStartTime: "08:00:00", examEndTime: "10:00:00"),
    ExamsModel(examSubject: "Python", examDate: "2022-06-05", examStartTime: "10:00:00", examEndTime: "12:00:00"),
    ExamsModel(examSubject: "C#", examDate: "2022-06-05", examStartTime: "12:00:00", examEndTime: "14:00:00"),
    ExamsModel(examSubject: "Flutter", examDate: "2022-06-05", examStartTime: "12:00:00", examEndTime: "14:00:00"),
    ExamsModel(examSubject: "Dart", examDate: "2022-06-05", examStartTime: "14:00:00", examEndTime: "16:00:00"),
    ExamsModel(examSubject: "NodeJs", examDate: "2022-06-07", examStartTime: "08:00:00", examEndTime: "10:00:00"),
    ExamsModel(examSubject: "PHP", examDate: "2022-06-07", examStartTime: "10:00:00", examEndTime: "12:00:00"),
    ExamsModel(examSubject: "React", examDate: "2022-06-07", examStartTime: "12:00:00", examEndTime: "14:00:00"),
    ExamsModel(examSubject: "Vue", examDate: "2022-06-07", examStartTime: "14:00:00", examEndTime: "16:00:00"),

    

  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: AppColors.primaryColor,
              ),
              centerTitle: true,
              title: Text('Midterms',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black)),
              actions: [
                Icon(
                  Icons.filter_list_alt,
                  color: AppColors.primaryColor,
                  size: 23.sp,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: ListView.builder(
                itemCount: midtermsList.length,
                itemBuilder: (context, index) => LecturesCardItem(
                      title: midtermsList[index].examSubject,
                      date: midtermsList[index].examDate,
                      endTime: midtermsList[index].examEndTime,
                      startTime: midtermsList[index].examStartTime,
                    )),
          );

  }}