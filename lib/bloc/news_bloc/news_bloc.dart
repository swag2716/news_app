import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/bloc/news_bloc/news_state.dart';
import 'package:news_app/models/article_model.dart';
import '../../helper/news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  News news;

  NewsBloc({required this.news}): super(NewsInitialState()){
    on<StartEvent>((event, emit) async{
      try{
        emit (NewsLoadingState());
        List<ArticleModel> articles = [];
        articles = await news.getNews();
        emit (NewsLoadedState(articles: articles));
      }catch(e){
        emit (NewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
