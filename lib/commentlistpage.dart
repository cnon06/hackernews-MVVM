import 'package:flutter/material.dart';
import 'package:hackernews/viewmodels/commentlistviewmodel.dart';
import 'package:hackernews/viewmodels/storyviewmodel.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';

import 'models/story.dart';

class CommentListPage extends StatelessWidget {
  StoryViewModel story;

  CommentListPage({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CommentListViewModel>(context, listen: false)
        .getCommmentsByStory(story);

    final vm = Provider.of<CommentListViewModel>(context);

     var unescape = HtmlUnescape();

    //story.story.title;



    // debugPrint(
    //     "STORY TITLE: ${story.title} STORY COMMENT_ID: ${story.story.title}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Column(
       // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
                        //alignment: Alignment.topCenter,
                         width: MediaQuery.of(context).size.width,
                       // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 164, 86, 212),
                        ),
                        child: Text(story.story.title,
                          style: const TextStyle(color: Colors.white),
                        )
                        ),
          ) ,

          Flexible(
            child: ListView.builder(
                itemCount: vm.comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
          
                    title: 
                    
                    
                    vm.comments[index].text !="" ?
          
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      width: 30,
                      //height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green[400],
                      ),
                      child: Text(
                        
                        unescape.convert(vm.comments[index].text),
                        style: const TextStyle(color: Colors.white),
                      )
                      ) 
                      : SizedBox(),
                    
                    
                    // Container(
                      
                    //   child: Text(vm.comments[index].text)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
