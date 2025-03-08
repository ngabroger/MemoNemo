import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:google_fonts/google_fonts.dart';

class FormUser extends StatefulWidget {
  final String title;
  final String hasAccount;
  final String button;
  final String route;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String, String) onPressed;

  const FormUser({
    super.key,
    required this.title,
    required this.button,
    required this.hasAccount,
    required this.route,
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Image.asset(
          "assets/images/ellipse.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            controller: widget.emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            controller: widget.passwordController,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              onPressed: () => widget.onPressed(
                                widget.emailController.text,
                                widget.passwordController.text,
                              ),
                              child: Text(
                                widget.button,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, widget.route);
                              },
                              child: Text(widget.hasAccount),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
