import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<void> createNote(String title, String content) async {
    try {
      await notesCollection.add({
        'title': title,
        'content': content,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateNote(String id, String title, String content) async {
    try {
      await notesCollection.doc(id).update({
        'title': title,
        'content': content,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await notesCollection.doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }
  Stream<QuerySnapshot> getNotes() {
    return notesCollection.orderBy('createdAt', descending: true).snapshots();
  }
}
