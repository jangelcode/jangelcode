import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Define a stateful widget for the Interests screen
class Interests extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

// Class to represent an interest
class Interest {
  String label;
  String photo;
  bool bol;
  Color col;

  // Constructor for Interest class
  Interest(String label, String photo, bool bol, Color col) {
    this.label = label;
    this.photo = photo;
    this.bol = bol;
    this.col = col;
  }
}

// Define the state for the Interests widget
class AppState extends State<Interests> {
  // List to store Interest objects
  List<Interest> interests = new List<Interest>();

  @override
  void initState() {
    super.initState();

    // Initialize the interests list with predefined interests
    interests.add(new Interest('Sports', 'assets/sports.png', false, Colors.white));
    interests.add(new Interest('Fitness', 'assets/Fitness.png', false, Colors.white));
    // ... (similarly, initialize other interests)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with a floating action button for navigation
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () => Navigator.pushNamed(context, '/Chats'),
      ),
      // App bar with a transparent background and no elevation
      appBar: new AppBar(
        title: new Text("Select up to 5 Interests"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Body of the Interests screen containing a stack
      body: Stack(
        children: <Widget>[
          // Padding with a GridView to display interests
          Padding(
            padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              children: getWidgets(),
            ),
          ),
        ],
      ),
    );
  }

  double selected = 0;

  // Function to create a list of interest widgets
  List<Widget> getWidgets() {
    List<Widget> widgets = new List<Widget>();
    this.interests.forEach((Interest interest) {
      widgets.add(
        new Container(
          // Container with decoration and a stack
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              // OutlineButton with an image and text for each interest
              OutlineButton(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      bottom: 55,
                      right: 5,
                      left: 5,
                      child: Image.asset(
                        interest.photo,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 1,
                      left: 1,
                      child: Center(
                        child: AutoSizeText(
                          interest.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
                highlightElevation: 0,
                onPressed: () => setState(() {}),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Opacity widget to show a checkmark when an interest is selected
              Opacity(
                opacity: interest.bol ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: RaisedButton(
                    elevation: 5,
                    child: Stack(
                      children: <Widget>[
                        Center(child: Icon(Icons.check_circle_outline, size: 70)),
                        Positioned(
                          bottom: 10,
                          right: 1,
                          left: 1,
                          child: Center(
                            child: AutoSizeText(
                              interest.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    color: Colors.grey[100],
                    onPressed: () => setState(() {
                      if (selected < 5) {
                        interest.bol = !interest.bol;
                        if (interest.bol) {
                          selected++;
                        } else if (interest.bol == false) {
                          selected--;
                        }
                      } else if (selected == 5 && interest.bol == true) {
                        interest.bol = !interest.bol;
                        selected--;
                      }
                    }),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return widgets;
  }
}

