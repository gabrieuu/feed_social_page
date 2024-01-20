import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    Modular.setInitialRoute("/home/");

    return MaterialApp.router(
        title: 'WeGram',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
          useMaterial3: true,
        ),
        routerConfig: Modular.routerConfig,
        );
  }
}