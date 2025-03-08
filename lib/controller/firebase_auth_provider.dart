import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/model/profile.dart';
import 'package:flutter_intern_challenge/services/firebase_auth_service.dart';
import 'package:flutter_intern_challenge/static/firebase_auth_status.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final FirebaseAuthService _service;

  FirebaseAuthProvider(this._service) {
    _fetchCurrentUser();
  }

  String? _message;
  Profile? _profile;
  bool? _loading = false;

  FirebaseAuthStatus _authStatus = FirebaseAuthStatus.unauthenticated;

  String? get message => _message;
  Profile? get profile => _profile;
  bool? get isLoading => _loading;

  FirebaseAuthStatus get authStatus => _authStatus;

  Future<void> _fetchCurrentUser() async {
    final user = await _service.currentUser();
    if (user != null) {
      _profile = Profile(
        name: user.displayName,
        email: user.email,
        photoUrl: user.photoURL,
      );
      _authStatus = FirebaseAuthStatus.authenticated;
    } else {
      _authStatus = FirebaseAuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  Future createdUser(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _authStatus = FirebaseAuthStatus.creatingAccount;
      notifyListeners();
      await _service.createUser(email, password);
      _authStatus = FirebaseAuthStatus.accountCreated;
      _loading = false;
      _message = "Account created successfully";
    } catch (e) {
      _loading = false;
      _message = e.toString();
      _loading = false;
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future signInUser(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _authStatus = FirebaseAuthStatus.authenticating;
      notifyListeners();
      final result = await _service.signInUser(email, password);
      _profile = Profile(
          name: result.user?.displayName,
          email: result.user?.email,
          photoUrl: result.user?.photoURL);

      _authStatus = FirebaseAuthStatus.authenticated;
      _loading = false;
      _message = "Sign in is Success";
    } catch (e) {
      _message = e.toString();
      _authStatus = FirebaseAuthStatus.error;
      _loading = false;
    }
    notifyListeners();
  }

  Future signOutUser() async {
    _loading = true;
    notifyListeners();
    try {
      _authStatus = FirebaseAuthStatus.signingOut;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 3));
      await _service.signOut();

      _authStatus = FirebaseAuthStatus.unauthenticated;
      _message = "Sign out is Success";
      _loading = false;
    } catch (e) {
      _message = e.toString();
      _loading = false;
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future<void> updateUserProfile(String name, String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      await _service.updateUserProfile(name, email, password);
      await _fetchCurrentUser(); // Refresh the user profile
      _message = "Profile updated successfully";
      _loading = false;
    } catch (e) {
      _message = e.toString();
      _loading = false;
    }
    notifyListeners();
  }

  Future<void> deleteAccount(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      await _service.reauthenticateUser(email, password);
      await _service.deleteUser();
      _authStatus = FirebaseAuthStatus.unauthenticated;
      _loading = false;
      _message = "Account deleted successfully";
      _profile = null; // Clear the profile data on account deletion
    } catch (e) {
      _message = e.toString();
      _loading = false;
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }
}
