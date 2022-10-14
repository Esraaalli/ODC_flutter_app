import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/constants/app_colors.dart';
import 'package:odc_app/presentation/screens/notes/edit_note_screen.dart';
import 'package:sizer/sizer.dart';

import '../business_logic/notes/notes_cubit.dart';
import '../data provider/local/sql_helperl.dart';
import '../presentation/screens/notes/add_notes_screen.dart';
import '../presentation/widgets/default_text.dart';

// ignore: must_be_immutable
class NotesCardItem extends StatelessWidget {
  int? index;
  NotesCardItem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesState>(listener: (context, state) {
      if (state is DatabaseCreate) {
        notesCubit.initialize();
      }
    }, builder: (context, state) {
      NotesCubit notesCubit = NotesCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: SqlHelper.getAllRowsDB(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                    child: DefaultText(
                  text: "There's No Data To Show",
                  fontSize: 20.sp,
                  textColor: Colors.black,
                ));
              }
              //if there's  data in the list of notes
              else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    shadowColor: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                  color: Colors.black)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data[index].date,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14.sp),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () => {
                                            notesCubit.getOneNote(
                                                context,
                                                snapshot.data[index].id,
                                                snapshot.data[index].title,
                                                snapshot
                                                    .data[index].description,
                                                snapshot.data[index].date)
                                          },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: AppColors.primaryColor,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        notesCubit
                                            .delete(snapshot.data[index].id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: AppColors.primaryColor,
                                      )),
                                ],
                              )
                            ],
                          ),
                          Text(snapshot.data[index].description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    });
  }
}
