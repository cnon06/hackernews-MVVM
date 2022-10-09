import 'package:flutter/material.dart';
import 'package:hackernews/viewmodels/storyviewmodel.dart';
import 'package:provider/provider.dart';

import '../commentlistpage.dart';
import '../viewmodels/commentlistviewmodel.dart';

class StoryList extends StatelessWidget {
  final List<StoryViewModel> stories;

  const StoryList({Key? key, required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              stories[index].title;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => 

        ChangeNotifierProvider.value(
          value: CommentListViewModel(),
          child: CommentListPage(story: stories[index]),
        )

                  
        //            ChangeNotifierProvider(
        //   create: (context) => CommentListViewModel(),
        //   child: CommentListPage(story: stories[index]),
        // )
        ),
                  
                 // CommentListPage()
                  
                  );
            },
            title: Text(
              stories[index].title,
              style: const TextStyle(fontSize: 20),
            ),
            trailing: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green[400],
                ),
                child: Text(
                  stories[index].numberOfComments.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
          );
        });
  }
}
