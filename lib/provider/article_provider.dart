import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticlesProvider extends ChangeNotifier {
  List<ArticlesModel> articles = [];
  void addArticles(jsonResponse) {
    articles = [];
    for (int i = 0; i < jsonResponse.length; ++i) {
      articles.add(ArticlesModel(
          id: jsonResponse[i]["id"],
          title: jsonResponse[i]["title"],
          url: jsonResponse[i]["url"],
          imageUrl: jsonResponse[i]["imageUrl"],
          summary: jsonResponse[i]["summary"]));
    }
  }
}
