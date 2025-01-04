import 'dart:convert';

import 'package:daily_news/core/db/cached/shared_pref.dart';
import 'package:daily_news/core/helper/errors/exceptions.dart';
import 'package:daily_news/core/models/news_model.dart';

class CachedData {
  List<NewsModel>? news;

  CachedData({required this.news});

  Future<void> cacheNews() async {
    if (news != null && news!.isNotEmpty) {
      List<Map<String, dynamic>> jsonList =
          news!.map((news) => news.toJson()).toList();

      var jsonString = jsonEncode(jsonList);

      await CacheHelper().saveData(key: 'news', value: jsonString);
    } else {
      throw CacheError(errorMsg: 'No Internet Connection');
    }
  }

  Future<List<NewsModel>> getLastNews() async {
    List<NewsModel> newsOfData = [];

    var jsonString = CacheHelper().getDataString(key: 'news');
    if (jsonString == null || jsonString.isEmpty) {
      throw CacheError(errorMsg: 'No Internet Connection');
    } else {
      List<dynamic> jsonList = jsonDecode(jsonString);
      newsOfData =
          jsonList.map((jsonData) => NewsModel.fromJson(jsonData)).toList();

      return Future.value(newsOfData);
    }
  }
}
