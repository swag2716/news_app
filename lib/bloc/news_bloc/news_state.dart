
import 'package:news_app/models/article_model.dart';

abstract class NewsState{
}

class NewsInitialState extends NewsState{
  
}
class NewsLoadingState extends NewsState{

}
class NewsLoadedState extends NewsState{
  final List<ArticleModel> articles;
  NewsLoadedState({required this.articles});
}
class NewsErrorState extends NewsState{
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
}