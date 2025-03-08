import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/controller/firebase_auth_provider.dart';
import 'package:flutter_intern_challenge/controller/firebase_notes_provider.dart';
import 'package:flutter_intern_challenge/firebase_options.dart';
import 'package:flutter_intern_challenge/screen/home_screen.dart';
import 'package:flutter_intern_challenge/screen/login_screen.dart';
import 'package:flutter_intern_challenge/screen/register_screen.dart';
import 'package:flutter_intern_challenge/screen/user_screen.dart';
import 'package:flutter_intern_challenge/services/firebase_auth_service.dart';
import 'package:flutter_intern_challenge/services/firestore_service.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/styles/theme/material_theme.dart';
import 'package:flutter_intern_challenge/styles/typho/util.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final firebaseAuth = FirebaseAuth.instance;
  runApp(MultiProvider(providers: [
    Provider(
      create: (context) => FirestoreService(),
    ),
    Provider(
      create: (context) => FirebaseAuthService(firebaseAuth),
    ),
    ChangeNotifierProvider(create: (context) => FirebaseNotesProvider()),
    ChangeNotifierProvider(
      create: (context) => FirebaseAuthProvider(
        context.read<FirebaseAuthService>(),
      ),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final initialRoute = firebaseAuth.currentUser == null
        ? NavigationRoutes.login.route
        : NavigationRoutes.home.route;

    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    final materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEMO NEMO',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      routes: {
        NavigationRoutes.register.route: (context) => RegisterScreen(),
        NavigationRoutes.login.route: (context) => LoginScreen(),
        NavigationRoutes.home.route: (context) => HomeScreen(),
        NavigationRoutes.profile.route: (context) => UserScreen(),
      },
    );
  }
}
