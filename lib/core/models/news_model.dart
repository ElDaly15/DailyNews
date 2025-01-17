class NewsModel {
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewsModel({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      sourceName: json['source']['name'] ?? 'Unknown Source',
      author: json['author'] ?? 'Unknown Author',
      title: json['title'] ?? 'Unknown Title',
      description: json['description'] ?? 'Unknown Description',
      url: json['url'] ?? 'https://www.google.co.uk/',
      urlToImage: json['urlToImage'] ??
          'https://archive.org/download/placeholder-image/placeholder-image.jpg',
      publishedAt: json['publishedAt'] ?? 'Unknown Date',
      content: json['content'] ?? 'Unknown Content',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': {'name': sourceName},
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
