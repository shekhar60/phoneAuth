import 'package:flutter/material.dart';
import 'package:shree_test_v1/loginScreen.dart';
import 'package:shree_test_v1/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text("Shree Krishna"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Constants.prefs.setBool("loggedIn", false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                })
          ],
        ),
        body: container(
        children: [
        Text("HomePage"),
        ]
        ),
    );
  }
}
