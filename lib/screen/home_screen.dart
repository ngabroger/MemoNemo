import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/controller/firebase_notes_provider.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/styles/theme/material_theme.dart';
import 'package:flutter_intern_challenge/styles/typho/util.dart';
import 'package:flutter_intern_challenge/widget/loading_dialog.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    final notesProvider = context.watch<FirebaseNotesProvider>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 12,
        backgroundColor: MaterialTheme(textTheme).light().primaryColor,
        title: Text(
          "Memo Nemo",
          style: TextStyle(
            color: MaterialTheme(textTheme)
                .light()
                .primaryTextTheme
                .bodySmall!
                .color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NavigationRoutes.profile.route);
            },
            icon: Icon(Icons.account_box),
            color: MaterialTheme(textTheme)
                .light()
                .primaryTextTheme
                .bodySmall!
                .color,
          ),
        ],
      ),
      body: notesProvider.isLoading ?? false
          ? Center(
              child: LoadingDialog(),
            )
          : ListView.builder(
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                final note = notesProvider.notes[index];
                return Dismissible(
                  key: Key(note.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    notesProvider.deleteNotes(note.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Note deleted')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => _showEditNoteDialog(
                      note.id,
                      note['title'],
                      note['content'],
                    ),
                    child: ListTile(
                      title: Text(note['title']),
                      subtitle: Text(note['content']),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateNoteDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showEditNoteDialog(String id, String title, String content) {
    final titleController = TextEditingController(text: title);
    final contentController = TextEditingController(text: content);
    final notesProvider = context.read<FirebaseNotesProvider>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: "Content"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                notesProvider.updateNotes(
                  id,
                  titleController.text.trim(),
                  contentController.text.trim(),
                );
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showCreateNoteDialog() {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final notesProvider = context.read<FirebaseNotesProvider>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: "Content"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                notesProvider.createNotes(
                  titleController.text.trim(),
                  contentController.text.trim(),
                );
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
