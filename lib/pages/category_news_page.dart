import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc/category_news_bloc/category_news_bloc.dart';
import '../bloc/news_bloc/category_news_bloc/category_news_event.dart';
import '../bloc/news_bloc/category_news_bloc/category_news_state.dart';
import 'home_page.dart';
import '../models/article_model.dart';

class CategoryNewsPage extends StatefulWidget {
  final String categoryName;

  const CategoryNewsPage({super.key, required this.categoryName});
  

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ArticleModel>articles = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryNewsBloc>(context).add(CategoryNewsStartEvent());
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.categoryName,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const Text("News",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 58, 68),
                  fontWeight: FontWeight.w600)),
        ]),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16), 
              child: const Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: BlocBuilder<CategoryNewsBloc, CategoryNewsState>(builder: (context, state) {
        if (state is CategoryNewsLoadingState) {
          // return Text("Loading State");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryNewsLoadedState){
          List<ArticleModel> articles = [];
          articles = state.articles;
          // return Text("Loaded State");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                //Blogs
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url,
                          );
                    },
                  ),
                )
              ],
            ),
          );
        } else if (state is CategoryNewsErrorState) {
          String error = state.errorMessage;
          // return Text("Error State");
          return Center(child: Text(error));
        } else {
          // return Text("Else State");
          return const Center(
            child: CircularProgressIndicator()
            );
        }
      }),
    );
  }
}