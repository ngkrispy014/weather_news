import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_news_app/viewmodel/NewsArticleViewModel.dart';

class NewsArticlePage extends StatelessWidget {
  final NewsArticleViewModel article;

  const NewsArticlePage({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  this.article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  this.article.publishedAt,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    imageUrl: this.article.urlToImage,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.network('https://via.placeholder.com/750x450'),

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  this.article.description ?? "No Contents",
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
