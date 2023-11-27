// Import necessary packages from the Flutter framework
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Define a stateful widget for adding a profile picture
class AddProfilePic extends StatefulWidget {
  @override
  AppStates createState() => AppStates();
}

// Define the state for the AddProfilePic widget
class AppStates extends State<AddProfilePic> {
  // Variable to hold the profile picture image
  Image image;

  // Build method to create the widget's UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold widget for the overall screen structure
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        // App bar with no elevation and white background
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        // Padding for the body content
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Center(
          // Center widget to center the content
          child: Column(
            // Column to arrange widgets vertically
            children: <Widget>[
              // Text widget displaying "Add a Profile Picture" with a specified font size
              Text('Add a Profile Picture', style: TextStyle(fontSize: 24)),
              Padding(padding: EdgeInsets.only(top: 20)), // Padding for spacing
              Container(
                // Container for the profile picture
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(62.5), // Circular border
                ),
                child: OutlineButton(
                  // Outline button with an icon for adding a photo
                  child: Icon(Icons.add_a_photo, size: 150),
                  onPressed: () {}, // Placeholder onPressed function
                  shape: CircleBorder(),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)), // Padding for spacing
              AutoSizeText(
                // AutoSizeText widget for dynamic text sizing
                'Think of this as your contact photo for everyone you meet',
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 40)), // Padding for spacing
              Container(
                // Container for the "Done" button
                width: MediaQuery.of(context).size.width * 0.4,
                height: 60,
                child: RaisedButton(
                  // RaisedButton with "Done" text, white color, and rounded border
                  child: Center(child: Text('Done', style: TextStyle(color: Colors.white))),
                  onPressed: () {}, // Placeholder onPressed function
                  color: Colors.blue[500], // Blue color for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
