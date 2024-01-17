import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(child: Container(child: Text("WeetGram", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),))),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index){
              return PostCard();
            }
            ))
        ],
      ),
    );
  }
}