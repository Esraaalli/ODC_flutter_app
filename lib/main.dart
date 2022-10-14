import 'package:flutter/material.dart';
import 'package:odc_app/bloc_observer.dart';
import 'package:odc_app/presentation/screens/auth/login/login.dart';
import 'package:odc_app/presentation/screens/exams/exams_cubit.dart';
import 'package:odc_app/presentation/screens/lectures/lectures_cubit.dart';
import 'package:odc_app/presentation/screens/news/news_cubit.dart';
import 'package:odc_app/presentation/screens/sections/sections_cubit.dart';
import 'package:odc_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/auth/login/login_cubit.dart';
import 'business_logic/auth/register/register_cubit.dart';
import 'business_logic/notes/notes_cubit.dart';
import 'constants/constant_methods.dart';
import 'data provider/local/cache_helper.dart';
import 'data provider/local/sql_helperl.dart';
import 'data provider/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlHelper.initialDB();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => LecturesCubit(),
            ),
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
            BlocProvider(
              create: (context) => SectionCubit(),
            ),
            BlocProvider(
              create: (context) => ExamsCubit(),
            ),
            BlocProvider(
              create: (context) => NewsCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ODC',
            theme: ThemeData(primarySwatch: Colors.deepOrange),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
