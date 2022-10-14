import '../../../data/models/news_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState{}
class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  late List<NewsModel> newsList;

  NewsLoaded({required this.newsList});
}

class NewsError extends NewsState {}
