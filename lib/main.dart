import 'package:feed_social_page/client_http/dio_client/dio_client.dart';
import 'package:feed_social_page/service/posts.service.dart';
import 'package:feed_social_page/store/posts_controller.dart';
import 'package:feed_social_page/view/bottom_bar.dart';
import 'package:feed_social_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social Feed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
          useMaterial3: true,
        ),
        home: BottomBar());
  }
}
