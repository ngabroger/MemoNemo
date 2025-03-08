import 'package:flutter/material.dart';
import 'package:flutter_intern_challenge/static/navigation_route.dart';
import 'package:flutter_intern_challenge/styles/theme/material_theme.dart';
import 'package:flutter_intern_challenge/styles/typho/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Montserrat", "Montserrat");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 12,
        backgroundColor: MaterialTheme(textTheme).light().primaryColor,
        title: Text(
          "Memo Nemo",
          style: TextStyle(
            color: MaterialTheme(textTheme)
                .light()
                .primaryTextTheme
                .bodySmall!
                .color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NavigationRoutes.profile.route);
            },
            icon: Icon(Icons.account_box),
            color: MaterialTheme(textTheme)
                .light()
                .primaryTextTheme
                .bodySmall!
                .color,
          ),
        ],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
