import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/services/firestore_service.dart';

class FirebaseNotesProvider extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();

  List<QueryDocumentSnapshot> _notes = [];
  bool? _loading = false;

  List<QueryDocumentSnapshot> get notes => _notes;
  bool? get isLoading => _loading;

  FirebaseNotesProvider() {
    getNotes();
  }

  void getNotes() {
    _loading = true;
    notifyListeners();

    _service.getNotes().listen((event) {
      _notes = event.docs;
      _loading = false;
      notifyListeners();
    });
  }

  void createNotes(String title, String content) async {
    _loading = true;
    notifyListeners();

    try {
      await _service.createNote(title, content);
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  void updateNotes(String id, String title, String content) async {
    _loading = true;
    notifyListeners();

    try {
      await _service.updateNote(id, title, content);
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  void deleteNotes(String id) async {
    _loading = true;
    notifyListeners();

    try {
      await _service.deleteNote(id);
      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
