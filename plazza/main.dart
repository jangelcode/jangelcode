import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/ProfileView.dart';
import 'Home.dart';
import 'SignUp.dart';
import 'AddProfilePic.dart';
import 'Groups.dart';
import 'Profile.dart';
import 'Personality.dart';
import 'Interests.dart';
import 'LoginPhone.dart';
import 'PhoneCode.dart';
import 'ChatScreen.dart';
import 'CreateNewGroup.dart';
import 'ProfileView.dart';
import 'Chats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Define color swatch for the app theme
  final baseColors = ColorSwatch(0xFF00fffa, {
    'regular': Color(0xFF00fffa),
    'light': Color(0xFF71ffff),
    'dark': Color(0xFF00cbc7),
    'good_one': Color(0xFF26c6da)
  });

  @override
  Widget build(BuildContext context) {
    // Precache images to improve performance
    precacheImage(AssetImage('assets/arts_and_entertainment.png'), context);
    // ... (repeat for other images)

    // Set preferred orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Plazza Demo',
      theme: ThemeData(
        primaryColor: baseColors['regular'],
      ),
      // Set the initial home as a Scaffold with buttons to navigate to different screens
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Button to navigate to Home screen
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Home'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Home');
                  },
                ),
                // ... (repeat for other buttons)
              ],
            ),
          ),
        ),
      ),
      // Define routes for navigation
      routes: {
        '/Home': (context) => Home(),
        '/AddProfilePic': (context) => AddProfilePic(),
        '/SignUp': (context) => SignUp(),
        '/Chats': (context) => Chats(),
        '/Profile': (context) => Profile(),
        '/Personality': (context) => Personality(),
        '/Interests': (context) => Interests(),
        '/PhoneLogin': (context) => LoginPhone(),
        '/PhoneCode': (context) => PhoneCode(),
        '/ChatScreen': (context) => ChatScreen(),
        '/CreateNewGroup': (context) => CreateNewGroup(),
        '/ProfileView': (context) => ProfileView(),
      },
    );
  }
}
