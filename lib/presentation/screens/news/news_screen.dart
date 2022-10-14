import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/presentation/screens/news/news_state.dart';
import 'package:odc_app/presentation/screens/sections/sections_cubit.dart';
import 'package:odc_app/presentation/screens/sections/sections_state.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../../../data/models/sections_model.dart';
import '../../../views/lecture_card_item.dart';
import 'news_cubit.dart';
import 'news_item.dart';

// ignore: must_be_immutable
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> newsList = [];

  @override
  void initState() {
    super.initState();
    NewsCubit.get(context).getNews(token: LoginCubit.get(context).token!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        if (state is NewsLoaded) {
          newsList = state.newsList;
          print(newsList[0].imageUrl);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: newsList.isNotEmpty,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: AppColors.primaryColor,
              ),
              centerTitle: true,
              title: Text('News',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black)),
              backgroundColor: Colors.white,
            ),
            body: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) =>
                    NewsItem(newsModel: newsList[index])),
          ),
        );
      },
    );
  }
}
