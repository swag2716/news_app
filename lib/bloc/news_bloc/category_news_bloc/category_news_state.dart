
import 'package:news_app/models/article_model.dart';

abstract class CategoryNewsState{
}

class CategoryNewsInitialState extends CategoryNewsState{
  
}
class CategoryNewsLoadingState extends CategoryNewsState{

}
class CategoryNewsLoadedState extends CategoryNewsState{
  final List<ArticleModel> articles;
  CategoryNewsLoadedState({required this.articles});
}
class CategoryNewsErrorState extends CategoryNewsState{
  final String errorMessage;
  CategoryNewsErrorState({required this.errorMessage});
}