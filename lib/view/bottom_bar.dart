import 'package:feed_social_page/utils/colors_app.dart';
import 'package:feed_social_page/view/home_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: [
                HomePage(),
                Container(child: Icon(Icons.chat)),
                Container(child: Icon(Icons.person)),
              ],
            ),
          ),
        );
    }

     Widget menu() {
      return Container(
        color: ColorApp.lightBlue,
        child: TabBar(
          labelColor: ColorApp.bgPrimary,
          unselectedLabelColor: Color.fromARGB(255, 212, 208, 213),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          labelPadding: EdgeInsets.all(10),
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(Icons.home_outlined),
            ),
            Tab(
              icon: Icon(Icons.chat),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      );
     }
}