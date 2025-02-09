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
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El contenido no puede estar vacio';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Titulo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 8,
              maxLength: 1000,
              controller: contentController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El contenido no puede estar vacio';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Contenido',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Guardando...')));
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
