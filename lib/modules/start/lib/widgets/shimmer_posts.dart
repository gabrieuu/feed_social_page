import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {
  ShimmerPost({super.key});
  double textWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, 
      highlightColor: Colors.grey.shade100,
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)), 
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       Container(
                              height: 20,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 144, 147, 173)
                              ),
                        ),
                      ],),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Column(
                          children: [
                            Container(
                              height: 20,
                              width: textWidth,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 144, 147, 173)
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 20,
                              width: textWidth,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 144, 147, 173)
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 20,
                              width: textWidth,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 144, 147, 173)
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 20,
                              width: textWidth,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 144, 147, 173)
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 20,
                              width: textWidth,
                              decoration: const BoxDecoration(
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: const Icon(Icons.favorite_border_outlined),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: const FaIcon(FontAwesomeIcons.comments,size: 20,),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(50),
                            child: const FaIcon(FontAwesomeIcons.retweet, size: 22),
                          ),                                          
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text("20 comments", style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              )
            ],
          )),
    ), 
      );
  }
}