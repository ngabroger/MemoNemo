import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/services/firestore_service.dart';

class FirebaseNotesProvider extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<QueryDocumentSnapshot> _notes = [];
  bool? _loading = false;
  StreamSubscription? _notesSubscription;
  StreamSubscription? _authSubscription;

  List<QueryDocumentSnapshot> get notes => _notes;
  bool? get isLoading => _loading;

  FirebaseNotesProvider() {
    _authSubscription = _auth.authStateChanges().listen((user) {
      if (user != null) {
        getNotes(user.uid);
      } else {
        _notes = [];
        notifyListeners();
      }
    });
  }

  void clearNotes() {
    _notes = [];
    notifyListeners();
  }

  void getNotes(String uid) {
    _loading = true;
    notifyListeners();

    _notesSubscription?.cancel();
    _notesSubscription = _service.getNotes(uid).listen((event) {
      _notes = event.docs;
      _loading = false;
      notifyListeners();
    });
  }

  Future<void> createNotes(String title, String content) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _service.createNote(user.uid, title, content);
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

  @override
  void dispose() {
    _notesSubscription?.cancel();
    _authSubscription?.cancel();
    super.dispose();
  }
}
