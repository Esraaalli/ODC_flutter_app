import 'package:flutter/material.dart';
import 'package:odc_app/data/models/news_model.dart';
import 'package:sizer/sizer.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.w))),
        child: ListTile(
          leading: Image.network(newsModel.imageUrl!, fit: BoxFit.fill),
          title: Text(newsModel.title!),
          subtitle: Text(newsModel.body!),
        ),
      ),
    );
  }
}
