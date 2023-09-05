import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/categories/news_tile.dart';

import '../model/article_model.dart';

class NewsListPage extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListPage({required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
