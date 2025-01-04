part of 'get_search_news_cubit.dart';

@immutable
sealed class GetSearchNewsState {}

final class GetSearchNewsInitial extends GetSearchNewsState {}

final class GetSearchNewsSuccess extends GetSearchNewsState {
  final List<NewsModel> news;
  GetSearchNewsSuccess(this.news);
}

final class GetSearchNewsFailuer extends GetSearchNewsState {
  final String message;
  GetSearchNewsFailuer(this.message);
}

final class GetSearchNewsLoading extends GetSearchNewsState {}
