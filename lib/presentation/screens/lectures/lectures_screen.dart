import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/lectures_model.dart';
import '../../../views/lecture_card_item.dart';
import 'lectures_cubit.dart';
import 'lectures_state.dart';

// ignore: must_be_immutable
class LecturesScreen extends StatefulWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  late LecturesCubit lecturesCubit;
  List<LecturesModel> lecturesList = [];

  @override
  void initState() {
    super.initState();
    lecturesCubit = LecturesCubit.get(context)
      ..getLectures(LoginCubit.get(context).model.accessToken!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LecturesCubit,LecturesStates>(
      listener: (context, state) {
        if (state is LecturesSuccessState) {
          print(state.lecturesList);
          lecturesList = state.lecturesList;
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: lecturesList.isNotEmpty,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: AppColors.primaryColor,
              ),
              centerTitle: true,
              title: Text('Lectures',
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
                itemCount: lecturesCubit.data.length,
                itemBuilder: (context, index) => LecturesCardItem(
                      title: lecturesList[index].lectureSubject,
                      date: lecturesList[index].lectureDate,
                      endTime: lecturesList[index].lectureEndTime,
                      startTime: lecturesList[index].lectureStartTime,
                    )),
          ),
        );
      },
    );
  }
}
