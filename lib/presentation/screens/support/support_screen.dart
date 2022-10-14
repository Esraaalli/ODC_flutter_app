import 'package:flutter/material.dart';
import 'package:odc_app/presentation/widgets/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
        title: Text('Support',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            DefaultTextFormField(
                hintText: 'Name',
                labelText: 'Name',
                maxLines: 1,
                fillcolor: Colors.black12,
                filled: true,
                prefixIcon: Icons.person,
                controller: TextEditingController(),
                validation: () {},
                onChanged: () {}),
            SizedBox(
              height: 2.h,
            ),
            DefaultTextFormField(
                hintText: 'E-Mail',
                labelText: 'E-Mail',
                maxLines: 1,
                fillcolor: Colors.black12,
                filled: true,
                prefixIcon: Icons.email_outlined,
                controller: TextEditingController(),
                validation: () {},
                onChanged: () {}),
            SizedBox(
              height: 2.h,
            ),
            DefaultTextFormField(
                hintText: 'What is making you unhappy?',
                labelText: 'What is making you unhappy?',
                maxLines: 5,
                fillcolor: Colors.black12,
                filled: true,
                controller: TextEditingController(),
                validation: () {},
                onChanged: () {}),
                SizedBox(
              height: 2.h,
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: 100,
              height: 50,
              color: Colors.orange.shade800,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.deepOrange)),
              child: const Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
