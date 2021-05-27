import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/screens/article.dart';
import 'package:news_app/services/article_services.dart';
import 'package:provider/provider.dart';

class ArtcilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ArticlesProvider _articleProvider = Provider.of<ArticlesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: FutureBuilder(
          future: ArticleServices().getAllArticles(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(_articleProvider.articles.length);
              return ListView.builder(
                itemCount: _articleProvider.articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Article(
                                  id: _articleProvider.articles[index].id)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Card(
                          child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        leading: Image.network(
                            _articleProvider.articles[index].imageUrl),
                        // leading: CachedNetworkImage(
                        //   imageUrl: _articleProvider.articles[index].imageUrl,
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.error),
                        // ),
                        title: Text(_articleProvider.articles[index].title),
                      )),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
