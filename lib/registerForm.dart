import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shree_test_v1/otpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shree_test_v1/widgets/gradientButton.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralController = TextEditingController();

  TextEditingController phoneNumberControler = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future register() async {
    var url = "https://northumbrian-drip.000webhostapp.com/registration.php";
    var response = await http.post(url, body: {
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneNumberControler.text,
      "referral": referralController.text,
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (conext) => OTPScreen(phoneNumberControler.text)));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (conext) => OTPScreen(phoneNumberControler.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefix: Text('+91'),
                      hintText: "Number",
                      icon: Icon(Icons.phone),
                      labelText: "Phone Number"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Number";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberControler,
                ),
              ),
            ),
            // Name
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Username",
                      icon: Icon(Icons.person),
                      labelText: "Name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                ),
              ),
            ),
            //email
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "username@example.com",
                      icon: Icon(Icons.email),
                      labelText: "Email"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Email";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                ),
              ),
            ),
            //referra
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.code), labelText: "Referral"),
                  textInputAction: TextInputAction.next,
                  controller: referralController,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GradientButton(
              width: 150,
              height: 45,
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  register();
                }
              },
              text: Text(
                "Register",
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
