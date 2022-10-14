import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/data/models/notes_model.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/notes/notes_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/default_text_form_field.dart';
import 'notes_screen.dart';
import 'package:intl/intl.dart';

class EditNotesScreen extends StatelessWidget {
  String title;
  int id;
  String description;

  TextEditingController editTitle = TextEditingController();
  TextEditingController editDescription = TextEditingController();

  EditNotesScreen({
    required this.description,
    required this.id,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      NotesCubit notesCubit = NotesCubit.get(context);
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
              color: AppColors.primaryColor,
            ),
            centerTitle: true,
            title: Text('Edit Notes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: notesCubit.editNoteKey,
              child: Column(
                children: [
                  DefaultTextFormField(
                      controller: editTitle..text = title,
                      hintText: "Enter Title",
                      labelText: "Title",
                      validation: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Your Title';
                        } else if (val.length > 50) {
                          return "Title must be less than 50 characters";
                        }
                      },
                      onChanged: (value) {
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  DefaultTextFormField(
                    controller: editDescription..text = description,
                    maxLines: 5,
                    hintText: "Enter Description",
                    labelText: "Description",
                    validation: (val) {
                      if (val.isEmpty) {
                        return 'Please Enter Your Description';
                      }
                    },
                    onChanged: (value) {
                      
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (notesCubit.editNoteKey.currentState!.validate()) {
                            notesCubit.update(
                              context,
                              id,
                              editTitle.text == "" ? title : editTitle.text,
                              editDescription.text == ""
                                  ? description
                                  : editDescription.text,
                              DateFormat("hh:mm a      dd/MM/yyyy")
                                  .format(DateTime.now()),
                            );
                          }
                        
                    },
                    minWidth: 100,
                    height: 50,
                    color: Colors.orange.shade800,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.deepOrange)),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
