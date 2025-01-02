import 'package:bloc/bloc.dart';
import 'package:daily_news/core/helper/api/dio_consumer.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo_impl.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_trending_news_state.dart';

class GetTrendingNewsCubit extends Cubit<GetTrendingNewsState> {
  GetTrendingNewsCubit() : super(GetTrendingNewsInitial());

  void getTrendingNews({required String q}) async {
    emit(GetTrendingNewsLoading());
    var response =
        await GetAllNewsRepoImpl(apiConsumer: DioConsumer(dio: Dio()))
            .getAllNews(q: q);
    response.fold((l) => emit(GetTrendingNewsFailuer(l.message)),
        (r) => emit(GetTrendingNewsSuccess(r)));
  }
}
