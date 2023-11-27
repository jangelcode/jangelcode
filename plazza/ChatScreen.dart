import 'package:flutter/material.dart';
import 'ChatMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

// Define a stateful widget for the chat screen
class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

// Define the state for the ChatScreen widget
class ChatScreenState extends State<ChatScreen> {
  // Initialize a random number generator and a variable to keep track of the last person who sent a message
  Random random = Random();
  String lastPerson = '';

  // List of names for message senders
  List names = ["Ling Waldner", "sally", "Me"];

  // Controller for the text input field
  final TextEditingController _chatController = new TextEditingController();

  // Function to handle submitting a message
  void _handleSubmit(String _text, String _person, String _type) {
    // Move focus to the text input field and clear the controller
    FocusScope.of(context).requestFocus(nodeOne);
    _chatController.clear();

    // Variable to determine if an icon should be displayed (based on whether the same person sent the last message)
    bool icon = true;

    // Check if the last person is the same as the current person
    if (lastPerson == _person) {
      icon = false;
    }

    // Update the last person variable
    lastPerson = _person;

    // Add the message to the Firestore collection
    setState(() {
      Firestore.instance.collection("Messages").add({
        'text': _text,
        'time': DateTime.now().toUtc().millisecondsSinceEpoch,
        'icon': icon,
        'username': _person,
        'type': _type,
      });
    });
  }

  // Focus node for the text input field
  FocusNode nodeOne = FocusNode();

  // Widget for the chat environment, including the text input field and send button
  Widget _chatEnvironment() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
              color: Colors.grey[700],
            ),
            new Flexible(
              child: new TextField(
                focusNode: nodeOne,
                decoration: new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(_chatController.text, names[random.nextInt(3)], 'type_1'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Scrollbar(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // StreamBuilder to listen for updates in the Firestore collection
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('Messages').orderBy('time', descending: true).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      // Handle different connection states (loading, done, etc.)
                      default:
                        return Flexible(
                          child: ListView.builder(
                            padding: new EdgeInsets.only(left: 0.0, right: 0.0),
                            reverse: true,
                            itemBuilder: (_, int index) => new ChatMessage(
                              // Create a ChatMessage widget for each message in the collection
                              text: snapshot.data.documents[index]['text'],
                              time: snapshot.data.documents[index]['time'],
                              icon: snapshot.data.documents[index]['icon'],
                              person: snapshot.data.documents[index]['username'],
                              type: snapshot.data.documents[index]['type'],
                            ),
                            itemCount: snapshot.data.documents.length,
                          ),
                        );
                    }
                  },
                ),
                new Divider(
                  height: 1,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: _chatEnvironment(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
