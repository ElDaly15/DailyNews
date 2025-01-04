import 'package:daily_news/core/db/cached/cached_data.dart';
import 'package:daily_news/core/helper/api/api_consumer.dart';
import 'package:daily_news/core/helper/api/endpoints.dart';
import 'package:daily_news/core/helper/errors/exceptions.dart';
import 'package:daily_news/core/helper/errors/failuer.dart';
import 'package:daily_news/core/internet/network_connection.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo.dart';
import 'package:daily_news/core/utils/consts.dart';
import 'package:dartz/dartz.dart';

class GetAllNewsRepoImpl implements GetAllNewsRepo {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  List<NewsModel> newsList = [];

  GetAllNewsRepoImpl({required this.apiConsumer, required this.networkInfo});
  @override
  Future<Either<Failuer, List<NewsModel>>> getAllNews(
      {required String q}) async {
    if (await networkInfo.isConnected!) {
      try {
        var response = await apiConsumer.get(Endpoints.everything,
            queryPrameters: {'q': q, 'apiKey': Consts.apiKey});
        for (var item in response['articles']) {
          newsList.add(NewsModel.fromJson(item));
        }
        await CachedData(news: newsList).cacheNews();
        return Right(newsList);
      } on ServerError catch (e) {
        return Left(Failuer(e.errorModel.errorMsg));
      } catch (e) {
        return Left(Failuer('An Error Occurred , Please try again later'));
      }
    } else {
      try {
        List<NewsModel> cachedNews =
            await CachedData(news: newsList).getLastNews();

        return Right(cachedNews);
      } on CacheError {
        return Left(Failuer('No Internet Connection'));
      }
    }
  }
}
