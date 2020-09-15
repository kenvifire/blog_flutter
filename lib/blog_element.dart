import 'package:blog_flutter/blog_content.dart';
import 'package:blog_flutter/styles.dart';
import 'package:flutter/material.dart';

class BlogElement extends StatelessWidget {
  final String title;
  final String picture;
  final String desc;
  final String path;

  BlogElement({@required this.title, @required this.desc, this.picture, @required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BlogContent(title: title, path: path)))
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey[300], width: 1))
        ),
        width: 800.0,
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(title,
                    style: kBlogElementTitleStyle),
                  Text(desc,
                    style: kBlogDescTextStyle,),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(picture))),
            ),
          ],
        ),
      ),
    );
  }
}
