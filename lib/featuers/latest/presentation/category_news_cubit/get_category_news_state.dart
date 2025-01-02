part of 'get_category_news_cubit.dart';

@immutable
sealed class GetCategoryNewsState {}

final class GetCategoryNewsInitial extends GetCategoryNewsState {}

final class GetCategoryNewsSuccess extends GetCategoryNewsState {
  final List<NewsModel> newsList;
  GetCategoryNewsSuccess(this.newsList);
}

final class GetCategoryNewsLoading extends GetCategoryNewsState {}

final class GetCategoryNewsFailuer extends GetCategoryNewsState {
  final String message;
  GetCategoryNewsFailuer(this.message);
}
