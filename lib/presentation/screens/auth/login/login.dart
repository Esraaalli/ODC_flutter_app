import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/auth/login/login_cubit.dart';
import '../../../../business_logic/auth/login/login_state.dart';
import '../../../../constants/constant_methods.dart';
import '../../../widgets/app_title.dart';
import '../../../widgets/default_text_form_field.dart';
import '../../../widgets/divider.dart';
import '../../app_layout/app_layout.dart';
import '../register/register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
      if (state is LoginSuccessState) {
        if(state.model.code=='Success')
        {
        flutterToast(msg: '${state.model.message}', color: Colors.green);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const AppLayout(),
            ),
            (route) => false);
        }
        else  {
        flutterToast(msg: '${state.model.message}', color: Colors.red);
      }
      } 
    }, builder: (context, state) {
      LoginCubit loginCubit = LoginCubit.get(context);

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 100), child: AppTitle()),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: loginKey,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 80, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 35),
                          ),
                          const SizedBox(height: 30),
                          DefaultTextFormField(
                            controller: emailController,
                            labelText: 'E-Mail',
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your Email';
                              }
                            },
                            onChanged: () {},
                          ),
                          const SizedBox(height: 30),
                          DefaultTextFormField(
                            controller: passwordController,
                            isPasswordField: true,
                            labelText: 'Password',
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                            },
                            onChanged: () {},
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    decoration: TextDecoration.underline),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (loginKey.currentState!.validate()) {
                                loginCubit.postLogin(
                                  email: emailController.text,
                                  password: passwordController.text,context: context
                                );

                              }
                            },
                            minWidth: 500,
                            height: 50,
                            color: Colors.orange.shade800,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.deepOrange)),
                            child: const Text(
                              'Login',
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

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            minWidth: 500,
                            height: 50,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.deepOrange, width: 2)),
                            child: Text(
                              'Sign Up',
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
