import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../views/notes_card_item.dart';
import '../app_layout/app_layout.dart';
import 'add_notes_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AppLayout())),
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
        title: Text('Notes',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AddNotesScreen())),
        backgroundColor: AppColors.primaryColor,
        child: Text(
          "+",
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: NotesCardItem(),
    );
  }
}
