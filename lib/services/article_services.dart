import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:provider/provider.dart';

class ArticleServices {
  String url = "https://api.spaceflightnewsapi.net/v3/";

  Future getAllArticles(context) async {
    Uri uri = Uri.parse(url + "articles/");
    ArticlesProvider _articleProvider = Provider.of<ArticlesProvider>(context);
    Response response = await get(uri);
    _articleProvider.addArticles(jsonDecode(response.body));
  }

  Future getSingleArticle(int id) async {
    Uri uri = Uri.parse(url + "articles/$id");
    Response response = await get(uri);
    final jsonResponse = jsonDecode(response.body);
    return ArticlesModel(
        title: jsonResponse["title"],
        imageUrl: jsonResponse["imageUrl"],
        summary: jsonResponse["summary"]);
  }
}
