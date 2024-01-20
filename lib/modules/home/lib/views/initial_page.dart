import 'package:feed_social_page/utils/colors_app.dart';
import 'package:feed_social_page/modules/home/lib/views/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: [
                HomePage(),
                Center(child: Text("Tela em construção..."),),
                Center(child: Text("Tela em construção..."),)
              ],
            ),
          ),
        );
    }

     Widget menu() {
      return Container(
        color: ColorApp.appBarColor,
        child: TabBar(
          labelColor: ColorApp.bgPrimary,
          unselectedLabelColor: Color.fromARGB(255, 212, 208, 213),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          labelPadding: EdgeInsets.all(10),
          dividerHeight: 0,
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