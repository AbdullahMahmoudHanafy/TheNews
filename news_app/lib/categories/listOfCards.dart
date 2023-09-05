import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/categoryModel.dart';

import 'categoryCard.dart';

class ListOfCards extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(name: "business", image: "assets/buisness.jpeg"),
    CategoryModel(name: "entertainment", image: "assets/entertaiment.avif"),
    CategoryModel(name: "top", image: "assets/general.jpeg"),
    CategoryModel(name: "health", image: "assets/health.avif"),
    CategoryModel(name: "science", image: "assets/science.avif"),
    CategoryModel(name: "sports", image: "assets/sports.jpeg"),
    CategoryModel(name: "technology", image: "assets/technology.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return card(model: categories[index]);
        },
      ),
    );
  }
}
