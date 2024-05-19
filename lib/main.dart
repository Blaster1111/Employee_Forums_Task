import 'package:employee_forums_task/providers/bottomNavigationProvider.dart';
import 'package:employee_forums_task/providers/likedPostProvider.dart';
import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:employee_forums_task/providers/savedPostProvider.dart';
import 'package:employee_forums_task/screens/homeScreen.dart';
import 'package:employee_forums_task/screens/likedPostScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (_) => LikedPostsProvider()),
        ChangeNotifierProvider(create: (_) => SavedPostsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/liked-posts': (context) => LikedPostsScreen(),
      },
    );
  }
}
