import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  Future<List<ArticleModel>> getNews() async {
    List<ArticleModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7d767d96d3be406fbebdfbf476aa297b";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['author']!=null && element["urlToImage"] != null && element["description"] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          
          news.add(articleModel);
        }
      });
      return news;
    }
    return news;
  }
}


class CategoryNews {
  Future<List<ArticleModel>> getCategoryNews(String category) async {
    List<ArticleModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=7d767d96d3be406fbebdfbf476aa297b";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['author']!=null && element["urlToImage"] != null && element["description"] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          
          news.add(articleModel);
        }
      });
      return news;
    }
    return news;
  }
}
