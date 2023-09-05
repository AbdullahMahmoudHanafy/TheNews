import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/model/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/news?apikey=pub_285950b13c90864ac47242ae5176fc1cd272a&country=us&category=$category');
      Map<String, dynamic> jsopnData = response.data;
      List<dynamic> articles = jsopnData["results"];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        if (article["title"] == null) continue;
        ArticleModel articleModel = ArticleModel(
          image: article['image_url'],
          title: article['title'],
          subTitle: article['description'],
          url: article['link'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } on Exception {
      return [];
    }
  }
}
