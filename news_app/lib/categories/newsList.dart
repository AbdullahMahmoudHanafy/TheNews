import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/categories/news_tile.dart';
import 'package:news_app_ui_setup/services/newsService.dart';

import '../model/article_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<ArticleModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getGeneral();
  }

  Future<void> getGeneral() async {
    articles = await NewsService(Dio()).getNews(category: "top");
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: NewsTile(
                    articleModel: articles[index],
                  ),
                );
              },
            ),
          );
  }
}
