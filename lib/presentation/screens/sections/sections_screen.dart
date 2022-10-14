import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/sections/sections_cubit.dart';
import 'package:odc_app/presentation/screens/sections/sections_state.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/sections_model.dart';
import '../../../views/lecture_card_item.dart';

// ignore: must_be_immutable
class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  late SectionCubit sectionCubit;
  List<SectionsModel> sectionsList = [];

  @override
  void initState() {
    super.initState();
    sectionCubit = SectionCubit.get(context)
      ..getSections(LoginCubit.get(context).model.accessToken!);
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionCubit, SectionStates>(
      listener: (context, state) {
        if (state is SectionSuccessState) {
          print(state.sectionsList);
          sectionsList = state.sectionsList;
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: sectionsList.isNotEmpty,
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
              title: Text('Sections',
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
                itemCount: sectionCubit.data.length,
                itemBuilder: (context, index) => LecturesCardItem(
                      title: sectionsList[index].sectionSubject,
                      date: sectionsList[index].sectionDate,
                      endTime: sectionsList[index].sectionEndTime,
                      startTime: sectionsList[index].sectionStartTime,
                    )),
          ),
        );
      },
    );
  }
}
