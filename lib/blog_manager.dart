import 'dart:convert';
import 'blog.dart';
import 'package:http/http.dart' as http;

class BlogManager {

  Future<List<Blog>> getBlogs() async {
    var api = 'http://www.itluobo.com/blog_index.json';
    final response = await http.get(api);
    if (response.statusCode == 200) {
      var jsonList = json.decode(utf8.decode(response.bodyBytes));
      return [...jsonList.map((json) => Blog.fromJson(json))];
    } else {
      throw Exception("Failed to load blogs");
    }
  }

  Future<String> getBlogContent(String path) async {
    var api = 'http://www.itluobo.com/$path';
    final response = await http.get(api);

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception("Failed to load content");
    }

  }
}