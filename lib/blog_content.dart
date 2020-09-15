import 'package:blog_flutter/blog_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogContent extends StatefulWidget {
  final String title;
  final String path;

  BlogContent({@required this.title, @required this.path});

  @override
  _BlogContentState createState() => _BlogContentState(title: this.title, path: this.path);
}

class _BlogContentState extends State<BlogContent> {

  final String title;
  final String path;
  Future<String> _content;

  _BlogContentState({@required this.title, @required this.path});

  @override
  void initState() {
    super.initState();
    _content = BlogManager().getBlogContent(path);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _content,
      initialData: '',
      builder: (context, snapshot) {
        return snapshot.hasData ?
        Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Markdown(
                  onTapLink: (url) {
                  },
                  data: snapshot.data,
                ),
              ),
            ),
        )
        :
        Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
