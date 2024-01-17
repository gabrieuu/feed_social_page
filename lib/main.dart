import 'package:feed_social_page/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Feed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}