import 'package:crud/db/operation.dart';
import 'package:crud/models/note.dart';
import 'package:crud/pages/save_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    Operation.getNotes();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE, arguments: Note.empty());
        },
      ),
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Container(child: _MyList()),
    );
  }
}

class _MyList extends StatefulWidget {
  @override
  State<_MyList> createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Note> notes = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<Note> auxNotes = await Operation.getNotes();
    setState(() {
      notes = auxNotes;
    });
  }

  Widget _createItem(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        print("Eliminado " + notes[i].title);
        Operation.delete(notes[i]);
      },
      child: ListTile(
        title: Text(notes[i].title),
        trailing: MaterialButton(
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.pushNamed(context, SavePage.ROUTE, arguments: notes[i]);
          },
        ),
      ),
    );
  }
}
