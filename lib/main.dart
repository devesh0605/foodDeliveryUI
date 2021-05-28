import 'package:flutter/material.dart';
import 'package:flutter_meal_ui/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App UI',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
            )),
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: HomeScreen(),
    );
  }
}
