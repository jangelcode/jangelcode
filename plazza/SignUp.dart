import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// Define a stateful widget for the Sign Up screen
class SignUp extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

// Define the state for the Sign Up widget
class LoginState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription<FirebaseUser> _listener;
  FirebaseUser _currentUser;
  var controllerDOB = new MaskedTextController(mask: '00/00/0000');
  var controllerPhone = new MaskedTextController(mask: '(000) 000-0000');

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  // Check the current user and set up a listener for changes
  void _checkCurrentUser() async {
    _currentUser = await _auth.currentUser();
    _currentUser?.getIdToken(refresh: true);
    _listener = _auth.onAuthStateChanged.listen((FirebaseUser user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  bool obscure=true;

  @override
  Widget build(BuildContext context) {
    // Check if a user is already signed in
    if (_currentUser == null) {
      // Return the Sign In screen if no user is signed in
      return new Scaffold(
        // Scaffold with an app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // Body of the Sign Up screen
        body: SignInScreen(
          color: Colors.white,
          showBar: false,
          avoidBottomInset: true,
          // Header of the Sign Up screen
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Center(child:Text('Sign Up',style: TextStyle(fontSize: 26),)),
              Padding(padding: EdgeInsets.only(top: 0),),
              Padding(child:Text('Name'),padding: EdgeInsets.only(left: 5)),
              // Text field for entering the name
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),),
              Padding(child:Text('Phone Number'),padding: EdgeInsets.only(left: 5)),
              // Text field for entering the phone number
              TextField(
                controller: controllerPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),),
              Padding(child:Text('Date of Birth'),padding: EdgeInsets.only(left: 5)),
              // Text field for entering the date of birth
              TextField(
                keyboardType: TextInputType.number,
                controller: controllerDOB,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: '00/00/0000'
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              // Button to complete the sign-up process
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child:
                        Text('Done',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  onPressed:(){
                    Navigator.pushNamed(context, '/Register');
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),),
              // Link to sign in if already a member
              Container(
                width: double.infinity,
                height: 60,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already a Member? '),
                        Text('Sign in',style: TextStyle(color: Colors.blue),)
                      ]
                    )
                  ),
                  onTap:(){
                    Navigator.pushNamed(context, '/PhoneLogin');
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),),
              Center(child:Text('Or')),
              Padding(padding: EdgeInsets.only(top: 10),)
            ]
          ),
          // List of available sign-in providers
          providers: [
            ProvidersTypes.google,
            ProvidersTypes.facebook
          ],
        )
      );
    } 
    else {
      // Return the Home Screen if a user is signed in
      return new HomeScreen(user: _currentUser);
    }
  }
}

// Define the Home Screen widget
class HomeScreen extends StatelessWidget {
  final FirebaseUser user;
  HomeScreen({this.user});

  @override
  Widget build(BuildContext context) => new Scaffold(
    // Content of the Home Screen
  );

  // Method to log out the current user
  void _logout() {
    FirebaseAuth.instance.signOut();
  }
}
