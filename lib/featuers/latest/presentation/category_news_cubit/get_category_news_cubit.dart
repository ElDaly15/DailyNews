import 'package:bloc/bloc.dart';
import 'package:daily_news/core/helper/api/dio_consumer.dart';
import 'package:daily_news/core/internet/network_connection.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo_impl.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_category_news_state.dart';

class GetCategoryNewsCubit extends Cubit<GetCategoryNewsState> {
  GetCategoryNewsCubit() : super(GetCategoryNewsInitial());
  void getNews({required String q}) async {
    emit(GetCategoryNewsLoading());
    var response = await GetAllNewsRepoImpl(
            apiConsumer: DioConsumer(dio: Dio()),
            networkInfo: NetworkInfoImpl(DataConnectionChecker()))
        .getAllNews(q: q);
    response.fold((l) => emit(GetCategoryNewsFailuer(l.message)),
        (r) => emit(GetCategoryNewsSuccess(r)));
  }
}
