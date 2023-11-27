import 'package:flutter/material.dart';

// Define a stateful widget for the Home screen
class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

// Define the state for the Home widget
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Scaffold with a white background
      backgroundColor: Colors.white,
      // App bar with transparent background and no elevation
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Body of the Home screen containing a column
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            // Padding with an image asset (logo)
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Image.asset('assets/PLAZZA.png'),
              ),
            ),
            // Container with a raised button for creating a new account
            Container(
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.blue[600],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text('Create New Account', style: TextStyle(color: Colors.white)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
              ),
            ),
            // Padding and Container with an InkWell for signing in
            Padding(padding: EdgeInsets.only(top: 5),),
            Container(
              width: double.infinity,
              height: 60,
              child: InkWell(
                // InkWell without splash and highlight color
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already a Member? '),
                      Text('Sign in', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/PhoneLogin');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
