import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shree_test_v1/otpScreen.dart';
import 'package:shree_test_v1/widgets/gradientButton.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController phoneNumberControler = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future loginData() async {
    var url = "https://northumbrian-drip.000webhostapp.com/login.php";
    var response = await http.post(url, body: {
      "phone": phoneNumberControler.text,
    });

    var data = json.decode(response.body);
    if (data == "Success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(phoneNumberControler.text)),
          (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Required..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: phoneNumberControler,
              decoration: InputDecoration(
                  prefix: Text('+91'),
                  icon: Icon(Icons.phone),
                  labelText: "Phone Number"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Number";
                }
                if (value.length != 10) {
                  return "Please Enter Valid Number";
                }
                return null;
              },
              maxLength: 10,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 10.0,
            ),
            GradientButton(
              width: 150,
              height: 45,
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  loginData();
                }
              },
              text: Text(
                "Verify",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
