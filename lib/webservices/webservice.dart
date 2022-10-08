import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackernews/models/comment.dart';
import 'package:http/http.dart' as http;

import '../models/story.dart';

class WebService {
  Future<List<Comment>> getCommmentsByStory(Story story) async {
    return Future.wait(story.commentIds.map((commentId) async {
      final url =
          "https://hacker-news.firebaseio.com/v0/item/$commentId.json?print=pretty";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Comment.fromJson(json);

        //debugPrint("${json['text']}");
        // debugPrint("$json");

        // return Story.fromJson(json);
      } else {
        throw Exception("Unable fetch data.");
      }
    }));

    // final url =
    //     "https://hacker-news.firebaseio.com/v0/item/2921983.json?print=pretty";

    // final response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   final json = jsonDecode(response.body);

    //   //debugPrint("${json['text']}");
    //   debugPrint("$json");

    //   // return Story.fromJson(json);
    // } else {
    //   throw Exception("Unable fetch data.");
    // }
  }

  Future<Story> _getStory(int storyID) async {
    final url =
        "https://hacker-news.firebaseio.com/v0/item/$storyID.json?print=pretty";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return Story.fromJson(json);
    } else {
      throw Exception("Unable fetch data.");
    }
  }

  Future<List<Story>> getTopStories() async {
    const url =
        "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);

      return Future.wait(storyIds.take(10).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw Exception("Unable fetch data.");
    }
  }
}
