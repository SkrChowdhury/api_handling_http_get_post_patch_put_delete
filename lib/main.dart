import 'package:api_handling_http_get_post_patch_put_delete/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
        primaryColor: Colors.orange[100],
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: const HomeScreen(),
    );
  }
}
