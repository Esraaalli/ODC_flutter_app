import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';

class OurPartenrsScreen extends StatelessWidget {
  const OurPartenrsScreen({Key? key}) : super(key: key);

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
        title: Text('Our Partenrs',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black)),
        backgroundColor: Colors.white,
      ),
    body: Column(
            children: [
              SizedBox(height: 20),
              Center(
                  child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.grey,
                                Colors.white,
                                Colors.grey,
                              ]),
                          border: Border.all(
                            color: Colors.white12,
                          ),
                          borderRadius: BorderRadius.circular(16)
                      ),

                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(width: 10),
                                Text(
                                  "ODC",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset('assets/images/logo.png'),
                        ],
                        )
                      //child:
                    ),
              )]

              )

            ,











    );
  }
}
