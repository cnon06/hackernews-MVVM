

class Comment {
  
  
  final String text;
  final dynamic id;


  Comment({required this.text, required this.id, });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      text: json["text"] ?? "",
      id:  json["id"] ?? "",
     
    );
  }
}
