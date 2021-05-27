import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/article_services.dart';

class Article extends StatelessWidget {
  int id;

  Article({this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: FutureBuilder(
        future: ArticleServices().getSingleArticle(this.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            ArticlesModel _article = snapshot.data;
            return Column(
              children: [
                Container(
                  child: Image.network(_article.imageUrl),
                  // child: CachedNetworkImage(
                  //   imageUrl: _article.imageUrl,
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => new Icon(Icons.error),
                  // ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _article.title,
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Summary: ",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _article.summary,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
