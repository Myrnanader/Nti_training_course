class NewsModel {
  int? totalArticles;
  List<Articles>? articles;

  NewsModel({this.totalArticles, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalArticles'] = totalArticles;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? id;
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  String? lang;
  Source? source;

  Articles({
    this.id,
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.lang,
    this.source,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    publishedAt = json['publishedAt'];
    lang = json['lang'];
    source = json['source'] != null
        ? Source.fromJson(json['source'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['content'] = content;
    data['url'] = url;
    data['image'] = image;
    data['publishedAt'] = publishedAt;
    data['lang'] = lang;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    return data;
  }
}

class Source {
  String? id;
  String? name;
  String? url;
  String? country;

  Source({this.id, this.name, this.url, this.country});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['country'] = country;
    return data;
  }
}
