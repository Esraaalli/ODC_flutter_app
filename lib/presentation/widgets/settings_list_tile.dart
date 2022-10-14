import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DefaultListTile extends StatelessWidget
{
  String title;
  Widget screen;
  DefaultListTile({Key? key,required this.title, required this.screen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
              leading: Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp),),
              trailing:const Icon(Icons.arrow_forward_ios),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>screen)),         
            );
  }
  
}