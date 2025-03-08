import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createNote(String uid, String title, String content) {
    return _db.collection('notes').add({
      'uid': uid,
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateNote(String id, String title, String content) {
    return _db.collection('notes').doc(id).update({
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteNote(String id) {
    return _db.collection('notes').doc(id).delete();
  }

  Stream<QuerySnapshot> getNotes(String uid) {
    return _db.collection('notes').where('uid', isEqualTo: uid).snapshots();
  }
}
