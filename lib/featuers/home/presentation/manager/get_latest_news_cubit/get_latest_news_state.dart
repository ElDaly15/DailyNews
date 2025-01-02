part of 'get_latest_news_cubit.dart';

@immutable
sealed class GetLatestNewsState {}

final class GetLatestNewsInitial extends GetLatestNewsState {}

final class GetLatestNewsSuccess extends GetLatestNewsState {
  final List<NewsModel> newsList;

  GetLatestNewsSuccess(this.newsList);
}

final class GetLatestNewsFailuer extends GetLatestNewsState {
  final String message;

  GetLatestNewsFailuer(this.message);
}

final class GetLatestNewsLoading extends GetLatestNewsState {}
