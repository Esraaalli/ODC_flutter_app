import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatefulWidget {
  // ignore: non_constant_identifier_names
  DefaultTextFormField({
    Key? key,
    this.labelText = "",
    this.hintText = "",
    this.startValue,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.maxLines = 1,
    this.isdense,
    this.prefixIcon,
    this.fillcolor,
    this.filled,
    required this.controller,
    required this.validation,
    required this.onChanged,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  String? startValue;
  bool isPasswordField=false;
  bool isObscureText;
  final int? maxLines;
  final TextEditingController controller;
  Function validation;
  Function onChanged;
  bool? isdense;
  IconData? prefixIcon;
  Color? fillcolor;
  bool? filled;
  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField?!widget.isObscureText:widget.isObscureText,
      maxLines: widget.maxLines,
      initialValue: widget.startValue,
      cursorColor: AppColors.primaryColor,
      
      validator: (value) => widget.validation(value),
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        isDense: widget.isdense,
        fillColor: widget.fillcolor,
        filled: widget.filled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular((5.sp))),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon((widget.isObscureText)
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: AppColors.primaryColor,
                onPressed: () {
                  setState(() {
                    widget.isObscureText = !widget.isObscureText;
                  });
                },
              )
            : const SizedBox(),prefixIcon: Icon(widget.prefixIcon,color: AppColors.primaryColor,),
      ),
    );
  }
}
