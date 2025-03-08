import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  FirebaseAuthService(
    FirebaseAuth? auth,
  ) : _auth = auth ??= FirebaseAuth.instance;

  Future<User?> currentUser() async {
    return _auth.currentUser;
  }

  Future<UserCredential> createUser(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "email-already-in-use" =>
          "There already exists an account with the given email address.",
        "invalid-email" => "The email address is not valid.",
        "operation-not-allowed" => "Server error, please try again later.",
        "weak-password" => "The password is not strong enough.",
        _ => "Register failed. Please try again.",
      };
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> signInUser(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "invalid-email" => "The email address is not valid.",
        "user-disabled" => "User disabled.",
        "user-not-found" => "No user found with this email.",
        "wrong-password" => "Wrong email/password combination.",
        _ => "Login failed. Please try again.",
      };
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.delete();
    } else {
      throw Exception("No user is currently signed in.");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Logout failed. Please try again.");
    }
  }

  Future<void> reauthenticateUser(String email, String password) async {
    final user = _auth.currentUser;
    if (user != null) {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      await user.reauthenticateWithCredential(credential);
    } else {
      throw Exception("No user is currently signed in.");
    }
  }

  Future<void> updateUserProfile(
      String name, String email, String password) async {
    final user = _auth.currentUser;
    if (user != null) {
      if (name.isNotEmpty) {
        await user.updateDisplayName(name);
      }
      if (email.isNotEmpty) {
        await user.updateEmail(email);
      }
      if (password.isNotEmpty) {
        await user.updatePassword(password);
      }

      await user.reload();
    } else {
      throw Exception("No user is currently signed in.");
    }
  }

  Future<User?> userChanges() => _auth.userChanges().first;
}
