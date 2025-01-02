part of 'get_trending_news_cubit.dart';

@immutable
sealed class GetTrendingNewsState {}

final class GetTrendingNewsInitial extends GetTrendingNewsState {}

final class GetTrendingNewsSuccess extends GetTrendingNewsState {
  final List<NewsModel> news;

  GetTrendingNewsSuccess(this.news);
}

final class GetTrendingNewsFailuer extends GetTrendingNewsState {
  final String message;

  GetTrendingNewsFailuer(this.message);
}

final class GetTrendingNewsLoading extends GetTrendingNewsState {}
