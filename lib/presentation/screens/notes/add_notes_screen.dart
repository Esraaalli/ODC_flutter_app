import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/notes/notes_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/default_text_form_field.dart';
import 'notes_screen.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
            title: Text('Add Notes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: notesCubit.addNoteKey,
              child: Column(
                children: [
                  DefaultTextFormField(
                    maxLines: 1,
                    controller: titleController,
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
                      notesCubit.title = value;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefaultTextFormField(
                    controller: descriptionController,
                    maxLines: 5,
                    hintText: "Enter Description",
                    labelText: "Description",
                    validation: (val) {
                      if (val.isEmpty) {
                        return 'Please Enter Your Description';
                      }
                    },
                    onChanged: (value) {
                      notesCubit.description = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (notesCubit.addNoteKey.currentState!.validate()) {
                        notesCubit.insert(context);
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
