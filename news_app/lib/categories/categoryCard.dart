import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/categoryModel.dart';
import 'package:news_app_ui_setup/screens/categortyPage.dart';

class card extends StatelessWidget {
  const card({required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return categoryPage(
                category: model.name,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 110,
          width: 200,
          child: Center(
              child: Text(
            model.name,
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(model.image),
            ),
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
