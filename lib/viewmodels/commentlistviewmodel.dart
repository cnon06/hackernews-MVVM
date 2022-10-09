import 'package:flutter/cupertino.dart';
import 'package:hackernews/viewmodels/storyviewmodel.dart';
import 'package:hackernews/webservices/webservice.dart';

import 'commentviewmodel.dart';

class CommentListViewModel extends ChangeNotifier {
  List<CommentViewModel> comments = [];

  Future<void> getCommmentsByStory(StoryViewModel storyVM) async {
    final results = await WebService().getCommmentsByStory(storyVM.story);
    comments = results.map((item) => CommentViewModel(comment: item)).toList();

    //stories = results.map((story) => StoryViewModel(story: story)).toList();

    notifyListeners();
    //  debugPrint("$results");
  }
}
