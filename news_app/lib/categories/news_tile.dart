import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/screens/wepPage.dart';
import '../model/article_model.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({required this.articleModel});

  final ArticleModel articleModel;
  final String defaultImage = "assets/default image.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: (articleModel.image == null)
              ? Image.asset(
                  "assets/default image.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  articleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return webPage(url: articleModel.url!);
                },
              ),
            );
          },
          child: Text(
            articleModel.title ?? "No-Tilte",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
