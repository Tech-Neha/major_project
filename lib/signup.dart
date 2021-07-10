import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:majorproject_covid19_tracker/homepage.dart';
import 'package:majorproject_covid19_tracker/loading/splashscreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up with",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFF3D657),
            height: 2,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              height: 60.0,
              child: Image.asset('images/ol.jpg'),
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
        SizedBox(
          height: 16,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Enter Email',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFF555143),
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
          onChanged: (value) {
            email = value; //Do something with the user input.
          },
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(
              color: Colors.white,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFF555143),
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
          onChanged: (value) {
            password = value; //Do something with the user input.
          },
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFF3D657),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF3D657).withOpacity(0.2),
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
                final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newUser != null){
                  Navigator.pushNamed(context, SplashScreen.id);
                }
              }catch (e){
                print(e);
              }
            },
            child: Center(
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C1C),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),


      ],
    );
  }
}
