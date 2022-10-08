import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';
import '../helper/news.dart';
import 'category_news_event.dart';
import 'category_news_state.dart';

class CategoryNewsBloc extends Bloc<CategoryNewsEvent, CategoryNewsState>{
  String category;
  CategoryNews categoryNews;

  CategoryNewsBloc({required this.category, required this.categoryNews}): super(CategoryNewsInitialState()){
    on<CategoryNewsStartEvent>((event, emit) async{
      try{
        emit (CategoryNewsLoadingState());
        List<ArticleModel> articles = [];
        articles = await categoryNews.getCategoryNews(category);
        emit (CategoryNewsLoadedState(articles: articles));
      }catch(e){
        emit (CategoryNewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
