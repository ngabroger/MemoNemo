import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/controller/firebase_auth_provider.dart';
import 'package:flutter_intern_challenge/static/firebase_auth_status.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/widget/form_user.dart';
import 'package:flutter_intern_challenge/widget/loading_dialog.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          title: "Login",
          button: "Sign in",
          hasAccount: "Don't Have an Account?",
          route: NavigationRoutes.register.route,
          onPressed: _tapToLogin,
        ),
        if (firebaseAuth.isLoading ?? false) LoadingDialog(),
      ],
    );
  }

  void _tapToLogin(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      await firebaseAuthProvider.signInUser(email, password);
      switch (firebaseAuthProvider.authStatus) {
        case FirebaseAuthStatus.authenticated:
          navigator.pushReplacementNamed(NavigationRoutes.home.route);
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
}
