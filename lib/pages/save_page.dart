import 'package:crud/db/operation.dart';
import 'package:crud/models/note.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  static const String ROUTE = '/save';

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  Note? note; // Puede ser nulo si estamos creando una nueva nota

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Obtener el argumento de la ruta de manera segura
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Note) {
      note = args;
      titleController.text = note!.title;
      contentController.text = note!.content;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  _init(Note note) {
    titleController.text = note.title;
    contentController.text = note.content;
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      Note newNote = Note(
        id: note?.id, // Si la nota ya existe, conserva su ID
        title: titleController.text,
        content: contentController.text,
      );

      if (note == null) {
        await Operation.insert(newNote);
      } else {
        await Operation.update(newNote);
      }

      Navigator.pop(context); // Regresar a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)?.settings.arguments as Note;
    _init(note ?? Note.empty());
    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? "Crear Nota" : "Editar Nota"),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El título no puede estar vacío';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 8,
              maxLength: 1000,
              controller: contentController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El contenido no puede estar vacío';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Contenido',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
