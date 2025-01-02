import 'package:daily_news/core/helper/api/api_consumer.dart';
import 'package:daily_news/core/helper/api/endpoints.dart';
import 'package:daily_news/core/helper/errors/exceptions.dart';
import 'package:daily_news/core/helper/errors/failuer.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo.dart';
import 'package:daily_news/core/utils/consts.dart';
import 'package:dartz/dartz.dart';

class GetAllNewsRepoImpl implements GetAllNewsRepo {
  final ApiConsumer apiConsumer;

  GetAllNewsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<Failuer, List<NewsModel>>> getAllNews(
      {required String q}) async {
    try {
      List<NewsModel> newsList = [];
      var response = await apiConsumer.get(Endpoints.everything,
          queryPrameters: {'q': q, 'apiKey': Consts.apiKey});
      for (var item in response['articles']) {
        newsList.add(NewsModel.fromJson(item));
      }

      return Right(newsList);
    } on ServerError catch (e) {
      return Left(Failuer(e.errorModel.errorMsg));
    } catch (e) {
      return Left(Failuer('An Error Occurred , Please try again later'));
    }
  }
}
