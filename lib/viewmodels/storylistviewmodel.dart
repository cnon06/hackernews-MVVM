import 'package:flutter/cupertino.dart';
import 'package:hackernews/viewmodels/storyviewmodel.dart';
import 'package:hackernews/webservices/webservice.dart';

class StoryListViewModel extends ChangeNotifier {
  List<StoryViewModel> stories = [];

  Future<void> getTopStories() async {
    final results = await WebService().getTopStories();

    stories = results.map((story) => StoryViewModel(story: story)).toList();

    notifyListeners();
    //  debugPrint("$results");
  }
}
