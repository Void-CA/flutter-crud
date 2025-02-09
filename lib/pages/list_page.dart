import 'package:crud/pages/save_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE);
        },
      ),
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: Text('Item 1'),
          ),
        ],
      )),
    );
  }
}
