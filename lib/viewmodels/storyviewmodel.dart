



import '../models/story.dart';

class StoryViewModel {
 
  final Story story;

  StoryViewModel({required this.story});

  String get title {
    return story.title;
  }

  String get url {
    return story.url;
  }


   int get numberOfComments {
    return story.commentIds.length;
  }

}
