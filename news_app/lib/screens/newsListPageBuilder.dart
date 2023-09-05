import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/article_model.dart';
import '../services/newsService.dart';
import 'newsListPage.dart';

class NewsListPageBuilder extends StatefulWidget {
  const NewsListPageBuilder({required this.category});
  final String category;
  @override
  State<NewsListPageBuilder> createState() => _NewsListPageBuilderState();
}

class _NewsListPageBuilderState extends State<NewsListPageBuilder> {
  List<ArticleModel> articles = [];

  bool loading = true;
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListPage(articles: snapshot.data ?? []);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text("oops, there was an error, try later"),
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
