import 'package:appscrip_task/features/users/screens/user_view_screen.dart';
import 'package:appscrip_task/features/users/screens/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
var h;
var w;
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
      ),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

