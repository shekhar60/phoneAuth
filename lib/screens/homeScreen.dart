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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFEFF3F6),
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0),
                                BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.9),
                                    offset: Offset(-6, -2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0)
                              ]),
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.bus_alert,
                                  color: Colors.pink.shade600,
                                ),
                                border: InputBorder.none,
                                hintText: "Palava City"),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFEFF3F6),
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0),
                                BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.9),
                                    offset: Offset(-6, -2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0)
                              ]),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.place,
                                  color: Colors.green.shade600,
                                ),
                                border: InputBorder.none,
                                hintText: "Andheri East"),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0XFFEFF3F6),
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0),
                                BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.9),
                                    offset: Offset(-6, -2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0)
                              ]),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.date_range,
                                  color: Colors.red.shade600,
                                ),
                                border: InputBorder.none,
                                hintText: "26/02/2021"),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    "Search Bus",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  )),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(6, 2),
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0),
                                    ]),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
