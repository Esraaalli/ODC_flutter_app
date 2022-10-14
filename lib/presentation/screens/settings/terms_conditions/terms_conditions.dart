import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odc_app/presentation/screens/settings/terms_conditions/terms_Cubit.dart';
import 'package:odc_app/presentation/screens/settings/terms_conditions/terms_State.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../../business_logic/auth/login/login_cubit.dart';

class TermsScreen extends StatelessWidget {

  @override
  String? htmlContent;

  TermsScreen({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getTerms(LoginCubit.get(context).model.accessToken!),
      child: BlocConsumer<TermsCubit, TermsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TermsCubit termsCubit = TermsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                title: const Text(
                  "Term & Condition",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              body: Container(
                  padding: EdgeInsets.all(15),
                  child: termsCubit.termModel == null
                      ? const Center(
                    child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent),
                  ) : ListView.builder(
                    itemBuilder: (context, index) {
                      htmlContent =
                          termsCubit.termModel!.data!.terms!.toString();

                      final TextSpan textSpan = HTML.toTextSpan(
                        context,
                        htmlContent!,
                        linksCallback: (dynamic link) {
                          debugPrint('You clicked on ${link.toString()}');
                        },
                        // as name suggests, optionally set the default text style
                        defaultTextStyle:
                        TextStyle(color: Colors.grey[700]),
                        overrideStyle: <String, TextStyle>{
                          'p': const TextStyle(fontSize: 17.3),
                          'a': const TextStyle(wordSpacing: 2),
                          // specify any tag not just the supported ones,
                          // and apply TextStyles to them and/override them
                        },
                      );

                      return RichText(text: textSpan);
                    },
                  )),
            ),
          );
        },
      ),
    );
  }
}
