import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/categories/listOfCards.dart';
import 'newsListPageBuilder.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListOfCards(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            NewsListPageBuilder(
              category: "top",
            ),
          ],
        ),
      ),
    );
  }
}
