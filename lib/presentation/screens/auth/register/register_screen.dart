import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/business_logic/auth/register/register_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/constant_methods.dart';
import '../../../widgets/app_title.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';
import '../../../widgets/divider.dart';
import '../../app_layout/app_layout.dart';
import '../login/login.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> genderMenu = const [
    DropdownMenuItem(
      value: 'm',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];
  String gender = 'm';

  void changeGender(val) {
    gender = val;
  }

  var genderSelected = "Select gender";
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccessState) {
        if (state.model.code == 'Success') {
          flutterToast(msg: '${state.model.message}', color: Colors.green);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AppLayout(),
              ),
              (route) => false);
        } else {
          flutterToast(msg: 'Register Failed,try again', color: Colors.red);
        }
      }
    }, builder: (context, state) {
      RegisterCubit registerCubit = RegisterCubit.get(context);

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: registerKey,
            child: ListView(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Center(child: AppTitle())),
                    SizedBox(height: 2.h,),
                DefaultTextFormField(
                    controller: nameController,
                    hintText: 'Name',
                    labelText: 'Name',
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      } else if (value.length > 32) {
                        return 'Name Must be less than 32 characters';
                      }
                    },
                    onChanged: () {}),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: emailController,
                    hintText: 'E-Mail',
                    labelText: 'E-Mail',
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
                    },
                    onChanged: () {}),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    labelText: 'Password',
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    onChanged: () {}),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    labelText: 'Confirm password',
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Confirm Password';
                      }
                    },
                    onChanged: () {}),
                SizedBox(
                  height: 3.h,
                ),
                DefaultTextFormField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Phone Number';
                      } else if (value.length != 11) {
                        return "Phone Number Must be 11 Number";
                      }
                    },
                    onChanged: () {}),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: 'Gender',
                      fontSize: 15.sp,
                    ),
                    Container(
                      height: 5.h,
                      width: 50.w,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(
                              color: Colors.deepOrange, width: 2.sp)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          onChanged: (value) {
                            registerCubit.changeGender(value);
                          },
                          value: registerCubit.gender,
                          items: genderMenu,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                MaterialButton(
                  onPressed: () {
                    if (registerKey.currentState!.validate()) {
                      registerCubit.postRegister(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneNumberController.text,
                          gender: registerCubit.gender == 'male' ? 'm' : 'f');
                    }
                  },
                  minWidth: 500,
                  height: 50,
                  color: Colors.orange.shade800,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange)),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: DefaultDivider()),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  minWidth: 500,
                  height: 50,
                  color: Colors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.deepOrange, width: 2)),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.orange.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
