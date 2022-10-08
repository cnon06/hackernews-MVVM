



import '../models/comment.dart';
import '../models/story.dart';

class CommentViewModel {
 
  final Comment comment;

  CommentViewModel({required this.comment});

  String get text {
    return comment.text;
  }

  String get id {
    return comment.id;
  }




}
