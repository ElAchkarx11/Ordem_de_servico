import 'package:flutter/material.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
