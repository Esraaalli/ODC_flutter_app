import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../data/models/home_card_model.dart';

// ignore: must_be_immutable
class HomeCardItem extends StatelessWidget {
  HomeCardModel homeModel;

  HomeCardItem({Key? key, required this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => homeModel.screen)),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(2.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.w))),
        shadowColor: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[200],
              child: SvgPicture.asset(homeModel.icon,color: Colors.deepOrange,width: 38,))
            ,
            const SizedBox(
              height: 20,
            ),
            Text(homeModel.title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
