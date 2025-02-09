import 'package:flutter/material.dart';
import 'package:crud/pages/list_page.dart';
import 'package:crud/pages/save_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        ListPage.ROUTE: (_) => ListPage(),
        SavePage.ROUTE: (_) => SavePage(),
      },
    );
  }
}
