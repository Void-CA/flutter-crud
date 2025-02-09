import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = '/save';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: Container(
        child: _FormSave(),
      ),
    );
  }
}

class _FormSave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titulo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contenido',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
