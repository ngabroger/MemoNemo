import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/controller/firebase_auth_provider.dart';
import 'package:flutter_intern_challenge/static/firebase_auth_status.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/widget/form_user.dart';
import 'package:flutter_intern_challenge/widget/loading_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = context.watch<FirebaseAuthProvider>();
    return Stack(
      children: [
        FormUser(
          emailController: _emailController,
          passwordController: _passwordController,
          title: "Register",
          button: "Sign up",
          hasAccount: "Already Have an Account?",
          route: NavigationRoutes.login.route,
          onPressed: _tapToRegister,
        ),
        if (firebaseAuth.isLoading ?? false) LoadingDialog(),
      ],
    );
  }

  void _tapToRegister(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      await firebaseAuthProvider.createdUser(email, password);
      switch (firebaseAuthProvider.authStatus) {
        case FirebaseAuthStatus.accountCreated:
          navigator.pushNamed(NavigationRoutes.login.route);
          break;
        default:
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Text(firebaseAuthProvider.message ?? ""),
          ));
          break;
      }
    } else {
      const message = "Fill the email and password correctly";

      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text(message),
      ));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
