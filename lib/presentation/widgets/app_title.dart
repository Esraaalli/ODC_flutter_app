import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Orange ",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: "Digital Center",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ]),
    );
  }
}
