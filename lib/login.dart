import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majorproject_covid19_tracker/loading/splashscreen.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1C1C1C),
              height: 2,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 60.0,
                child: Image.asset('images/kk.png'),
              ),
              Text(
                "COVID-19 TRACKER",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF3D657),
                  letterSpacing: 2,
                  height: 1,
                ),
              ),
            ],
          ),
          Text(
            "Please login to continue",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1C1C1C),
              height: 1,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFFC1A745),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Color(0xFFECCB45),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
            onChanged: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFFC1A745),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Color(0xFFECCB45),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
            onChanged: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF1C1C1C),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1C1C1C).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: () async {
                print(email);
                print(password);
                try {
                  final newUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, SplashScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF3D657),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
