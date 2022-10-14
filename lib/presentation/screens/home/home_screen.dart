import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_colors.dart';
import '../../../data/home_data.dart';
import '../../../views/home_card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.white)),
          backgroundColor: AppColors.primaryColor,
        ),
        body: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .9,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 2,
            crossAxisCount: 2,
          ),
          itemCount: homeItem.length,
          itemBuilder: (_, int index) =>
              HomeCardItem(homeModel: homeItem[index]),
        ),
      ),
    );
  }
}
