import 'package:daily_news/core/helper/errors/failuer.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllNewsRepo {
  Future<Either<Failuer, List<NewsModel>>> getAllNews({required String q});
}
