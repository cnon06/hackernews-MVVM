import 'package:flutter/material.dart';
import 'package:hackernews/viewmodels/storylistviewmodel.dart';

import 'package:hackernews/widgets/story_list.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StoryListViewModel>(context, listen: false).getTopStories();

    //  final vm = Provider.of<StoryListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Hacker News")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            Consumer<StoryListViewModel>(builder: (context, vm, child) {
              return Flexible(child: StoryList(stories: vm.stories));
            }),

            // Flexible(child: StoryList(stories: vm.stories)),
          ],
        ),
      ),
    );
  }
}
