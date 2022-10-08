import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String url;
  const ArticlePage({required this.url});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title:
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: const [
          Text(
            "News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text("App",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 58, 68),
                  fontWeight: FontWeight.w600)),
        ]
        ),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webViewController) {
            completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
