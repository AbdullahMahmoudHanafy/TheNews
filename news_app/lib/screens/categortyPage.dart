import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/screens/newsListPageBuilder.dart';

class categoryPage extends StatelessWidget {
  const categoryPage({required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListPageBuilder(
            category: category,
          ),
        ],
      ),
    );
  }
}
