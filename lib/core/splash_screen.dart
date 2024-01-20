

import 'package:feed_social_page/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: ColorApp.lightBlue
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WeGram ", style: TextStyle(fontSize: 40, color: ColorApp.bgPrimary, fontWeight: FontWeight.bold),),
              FaIcon(FontAwesomeIcons.comments, size: 40, color: ColorApp.bgSecondary,)
            ],
          ),
        ),
      ),
    );
  }
}