import 'package:flutter/material.dart';
import 'package:hackernews/homepage.dart';
import 'package:hackernews/viewmodels/storylistviewmodel.dart';
import 'package:hackernews/webservices/webservice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webService = WebService();
    // webService.getCommmentsByStory();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => StoryListViewModel(),
          child: MyHomePage(),
        ));
  }
}
