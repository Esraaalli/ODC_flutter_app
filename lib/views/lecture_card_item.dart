import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../presentation/screens/lectures/lectures_cubit.dart';
import '../presentation/screens/lectures/lectures_state.dart';

// ignore: must_be_immutable
class LecturesCardItem extends StatelessWidget {
  String? title;
  String? date;
  String? startTime;
  String? endTime;

 LecturesCardItem({Key? key,required this.title,required this.date,required this.startTime,required this.endTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LecturesCubit, LecturesStates>(
        builder: (context, state) {
      LecturesCubit lecturesCubit = LecturesCubit.get(context);

      return Card(
        elevation: 5,
        margin: EdgeInsets.all(2.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.w))),
        shadowColor: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black)),
                  Row(
                    children: [
                      Icon(Icons.timer_rounded, color: Colors.grey[700]),
                      const Text('2hrs')
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(date!)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Start Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey)),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: Colors.green[200],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(startTime!)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("End Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey)),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: Colors.red[200],
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(endTime!)
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
