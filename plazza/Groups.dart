import 'package:flutter/material.dart';
import 'package:mobile/ProfileView.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ChatScreen.dart';

// Define a stateful widget for the Groups screen
class Groups extends StatefulWidget {
  @override
  Boomwhaddup createState() => Boomwhaddup();
}

// Define the state for the Groups widget
class Boomwhaddup extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating action button for creating a new group
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/CreateNewGroup');
        },
      ),
      // App bar for the Groups screen
      appBar: new AppBar(
        title: new Text("Groups"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          // User profile image in the app bar leading to the ProfileView screen
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage('assets/Partying.png'),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            },
          )
        ],
      ),
      // Body of the Groups screen with a stack containing a centered GroupBack widget
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Center(
                  child: GroupBack(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Custom page route animation for scaling transitions
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              ),
        );
}

// Stateful widget for displaying a list of groups
class GroupBack extends StatefulWidget {
  @override
  GroupList createState() => GroupList();
}

// State for the GroupBack widget
class GroupList extends State<GroupBack> {
  // List of notifications
  List<Map<String, dynamic>> notifications = new List<Map<String, dynamic>>();
  bool opac = true;

  // Initialization of state, fetching notifications from Firestore
  void initState() {
    super.initState();
    Firestore.instance
        .collection('notifications')
        .where("user", isEqualTo: "IRmLJFD5nkrb8o2BuceS")
        .snapshots()
        .listen((data) =>
            notifications = data.documents.map((document) => document.data).toList());
  }

  @override
  Widget build(BuildContext context) {
    // Stream builder for listening to changes in the groups collection
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('groups').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new Column(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .825,
                    height: MediaQuery.of(context).size.height * .15,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the ChatScreen when a group is tapped
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.scale,
                                alignment: Alignment.center,
                                child: ChatScreen()));
                      },
                      child: Card(
                        elevation: 15,
                        color: Colors.primaries[document['color']],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: <Widget>[
                            // Positioned widgets for additional UI elements
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios, size: 30),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 40,
                              child: Text(document['name'],
                                  style: TextStyle(color: Colors.white, fontSize: 22)),
                            ),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: Row(children: <Widget>[
                                  Text(document['notify'] ? 'Notifications On' : 'Notifications Off',
                                    style: TextStyle(color: Colors.white, fontSize: 14)),
                                  IconButton(
                                    // IconButton to toggle notifications
                                    icon: (document['notify']
                                        ? Icon(Icons.alarm)
                                        : Icon(Icons.alarm_off)),
                                    onPressed: () {
                                      opac = !opac;
                                      document.reference.updateData({
                                        'notify': !document.data['notify']
                                      });
                                    },
                                  )
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
