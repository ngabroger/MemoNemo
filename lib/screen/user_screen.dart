import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/controller/firebase_auth_provider.dart';
import 'package:flutter_intern_challenge/static/firebase_auth_status.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/styles/theme/material_theme.dart';
import 'package:flutter_intern_challenge/styles/typho/util.dart';
import 'package:flutter_intern_challenge/widget/loading_dialog.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  XFile? _imageFile;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthProvider firebaseAuth =
        context.watch<FirebaseAuthProvider>();
    final profile = firebaseAuth.profile;
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: MaterialTheme(textTheme)
              .light()
              .primaryTextTheme
              .bodySmall!
              .color,
        ),
        elevation: 12,
        backgroundColor: MaterialTheme(textTheme).light().primaryColor,
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: MaterialTheme(textTheme)
                .light()
                .primaryTextTheme
                .bodySmall!
                .color,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (profile != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: _imageFile != null
                                    ? FileImage(File(_imageFile!.path))
                                    : (profile.photoUrl != null
                                        ? NetworkImage(profile.photoUrl!)
                                        : null) as ImageProvider?,
                                child: _imageFile == null &&
                                        profile.photoUrl == null
                                    ? Icon(Icons.person, size: 50)
                                    : null,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              profile.name ?? "Helloo Friend",
                              style: textTheme.bodyMedium,
                            ),
                            SizedBox(height: 10),
                            Text(
                              profile.email ?? "No Email",
                              style: textTheme.bodySmall,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: _showEditProfileDialog,
                              child: Text("Edit Profile"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _tapToLogout,
                      child: Text("Logout"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MaterialTheme.customRed),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: _showDeleteConfirmationDialog,
                      child: Text("Delete"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (firebaseAuth.isLoading ?? false)
            Center(child: const LoadingDialog()), // Center the LoadingDialog
        ],
      ),
    );
  }

  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  void _showEditProfileDialog() {
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final profile = firebaseAuthProvider.profile;

    if (profile != null) {
      _nameController.text = profile.name ?? "";
      _emailController.text = profile.email ?? "";
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null
                        ? FileImage(File(_imageFile!.path))
                        : (profile?.photoUrl != null
                            ? NetworkImage(profile!.photoUrl!)
                            : null) as ImageProvider?,
                    child: _imageFile == null && profile?.photoUrl == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  enabled: false, // Disable the email field
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ],
            ),
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
                Navigator.of(context).pop();
                _updateProfile();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _updateProfile() async {
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await firebaseAuthProvider.updateUserProfile(name, email, password);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(firebaseAuthProvider.message ?? ""),
    ));
  }

  void _tapToLogout() async {
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider.signOutUser();
    switch (firebaseAuthProvider.authStatus) {
      case FirebaseAuthStatus.unauthenticated:
        navigator.pushReplacementNamed(NavigationRoutes.login.route);
        break;
      default:
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(firebaseAuthProvider.message ?? ""),
        ));
        break;
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Are you sure you want to delete your account? This action cannot be undone."),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
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
                Navigator.of(context).pop();
                _tapToDelete();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _tapToDelete() async {
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    await firebaseAuthProvider.deleteAccount(email, password);
    switch (firebaseAuthProvider.authStatus) {
      case FirebaseAuthStatus.unauthenticated:
        navigator.pushReplacementNamed(NavigationRoutes.login.route);
        break;
      default:
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(firebaseAuthProvider.message ?? ""),
        ));
        break;
    }
  }
}
