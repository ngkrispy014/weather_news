class NewsArticle {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  NewsArticle(this.title, this.author, this.description, this.urlToImage, this.url, this.publishedAt, this.content);
      //Constructor

  factory NewsArticle.fromJson(Map<String,dynamic> json){
    return NewsArticle(
        json['title'] ?? '',
        json['author'] ?? '',
        json['description'] ?? '',
        json['urlToImage'] ?? '',
        json['url'] ?? '',
        json['publishedAt'] ?? '',
        json['content'] ?? ''
    );
  }//deserialize json
}