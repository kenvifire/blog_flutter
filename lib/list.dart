import 'package:blog_flutter/blog_element.dart';
import 'package:blog_flutter/blog_manager.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'blog.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  Future<List<Blog>> _blogList;

  @override
  void initState() {
    super.initState();
    _blogList = BlogManager().getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _blogList,
      initialData: [],
      builder: (context, snapshot) {
        return snapshot.hasError
            ? Center(
                child: Text(snapshot.error.toString()),
              )
            : snapshot.hasData
                ? Scaffold(
                    appBar: AppBar(
                      title: Text("Blog list"),
                    ),
                    body: FooterView(
                      children: [
                        Container(
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                ...snapshot.data.map((blog) => BlogElement(
                                    title: blog.title,
                                    desc: blog.desc,
                                    path: blog.path,
                                    picture: blog.pic))
                              ]),
                            ),
                          ),
                        ),
                      ],
                      footer: Footer(
                        child: Column(
                          children: [
                            Text(
                                '© 1988-2020 Itluobo.com. All rights reserved. 鄂ICP备15009294号')
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
      },
    );
  }
}
