import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrivania/model/entity/note.dart';
import 'package:scrivania/provider/note_provider.dart';

class Edit extends StatefulWidget {
  final Note note;
  final bool isNewNote;
  const Edit({super.key, required this.note, required this.isNewNote});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    // if (widget.note != null) {
    //   _titleController = TextEditingController(text: widget.note!.title);
    //   _contentController = TextEditingController(text: widget.note!.content);
    // }
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).initNotes();
  }

  // adding a new note
  void addNewNote() {
    // get new id
    int id = Provider.of<NoteProvider>(context, listen: false).getAllNotes().length;
    // get title and content from editor
    String title = _titleController.text;
    String content = _contentController.text;
    DateTime time = DateTime.now();
    Provider.of<NoteProvider>(context, listen: false)
        .addNote(Note(id: id, title: title, content: content, modifiedTime: time));
  }

  // update existing note
  void updateNote() {
    // get title and content from editor
    String title = _titleController.text;
    String content = _contentController.text;
    // update note
    Provider.of<NoteProvider>(context, listen: false)
        .updateNote(widget.note, title, content);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  // it's a new note
                  if(widget.isNewNote && _titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
                    addNewNote();
                    // It's an existing note
                  } else {
                    updateNote();
                  }
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
            )
        ]
    ),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: _titleController,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                  ),
                  TextField(
                    controller: _contentController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something here',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.save),
      ),
    );
  }
}
