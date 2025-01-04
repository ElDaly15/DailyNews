// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:daily_news/core/helper/api/dio_consumer.dart';
import 'package:daily_news/core/internet/network_connection.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo_impl.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_search_news_state.dart';

class GetSearchNewsCubit extends Cubit<GetSearchNewsState> {
  GetSearchNewsCubit() : super(GetSearchNewsInitial());
  void getNews({required String q}) async {
    emit(GetSearchNewsLoading());
    var response = await GetAllNewsRepoImpl(
            apiConsumer: DioConsumer(dio: Dio()),
            networkInfo: NetworkInfoImpl(DataConnectionChecker()))
        .getAllNews(q: q);
    response.fold((l) => emit(GetSearchNewsFailuer(l.message)),
        (r) => emit(GetSearchNewsSuccess(r)));
  }

  void resetSearchResults() {
    emit(GetSearchNewsInitial());
  }
}
