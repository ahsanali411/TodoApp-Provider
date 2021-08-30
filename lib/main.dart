import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/home.dart';
import 'package:provider_todo_app/todoModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoModel()),
      ],
      child: MyApp(),
    ),
    //   MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}
