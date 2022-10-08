import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/helper/categories.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category_news_page.dart';
import '../bloc/news_bloc/category_news_bloc/category_news_bloc.dart';
import '../bloc/news_bloc/news_bloc.dart';
import '../bloc/news_bloc/news_state.dart';
import 'article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(StartEvent());
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text(
            "News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text("App",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 58, 68),
                  fontWeight: FontWeight.w600)),
        ]),
        elevation: 0.0,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsLoadingState) {
          // return Text("Loading State");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsLoadedState) {
          List<ArticleModel> articles = [];
          articles = state.articles;
          // return Text("Loaded State");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                //Categories
                Container(           
                  height: 80,
                 
                  child: Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName);
                        }),
                  ),
                ),

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
        } else if (state is NewsErrorState) {
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

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => BlocProvider(
          create: (context) => CategoryNewsBloc(categoryNews: CategoryNews(),category: categoryName),
          child: CategoryNewsPage(categoryName: categoryName)))));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl:
                    imageUrl,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black26,
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String url;

  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => ArticlePage(url: url,))));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(imageUrl)
            ),
          const SizedBox(height: 8.0,),
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),),
          const SizedBox(height: 8.0,),
          Text(desc, style: TextStyle(color: Colors.grey[600]),),
        ]),
      ),
    );
  }
}
