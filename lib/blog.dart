import 'package:flutter/cupertino.dart';

class Blog {
  final String title;
  final String author;
  final String createdDate;
  final String path;
  final String desc;
  final String pic;
  final bool published;


  Blog({@required this.title, @required this.author, @required this.path,
    this.createdDate, this.desc, this.pic, this.published
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      author: json['author'],
      path: json['path'],
      desc: json['desc'],
      pic: json['pic'],
      published: json['published']
    );
  }
}