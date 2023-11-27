import 'package:flutter/material.dart';

// Define a stateful widget for a chat message
class ChatMessage extends StatefulWidget {
  // Variables to store message details
  final int time;
  final String text, person, type;
  final bool icon;

  // Constructor to initialize variables
  ChatMessage({this.text, this.time, this.person, this.type, this.icon});

  @override
  TextContent createState() => TextContent();

  // Method to check if the message sender is the user
  bool isUser() {
    if (person == 'Me') {
      return true;
    }
    return false;
  }
}

// Define the state for the ChatMessage widget
class TextContent extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    // Define variables based on whether the message is from the user or not
    final bg = widget.isUser() ? Colors.blue[200] : Colors.grey[200];
    final align = widget.isUser() ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final padding = widget.isUser() ? EdgeInsets.only(right: 20, bottom: 20) : EdgeInsets.only(left: 0, bottom: 20);
    final radius = widget.isUser()
        ? BorderRadius.only(
            topLeft: Radius.circular(9.0),
            bottomLeft: Radius.circular(9.0),
            bottomRight: Radius.circular(9.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(9.0),
            bottomLeft: Radius.circular(9.0),
            bottomRight: Radius.circular(9.0),
          );

    final paddingNew = widget.isUser() ? EdgeInsets.only(right: 20, bottom: 20) : EdgeInsets.only(left: 90, bottom: 20);

    // If the message is from the user
    if (widget.isUser()) {
      // Return a draggable container with message content
      return Draggable(
        affinity: Axis.horizontal,
        axis: Axis.horizontal,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Text(
                widget.person,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: radius,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                    ),
                  ),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.7,
                  minWidth: 20.0,
                ),
              ),
            ],
          ),
        ),
        feedback: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Text(
                widget.person,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: radius,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                    ),
                  ),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.7,
                  minWidth: 20.0,
                ),
              ),
            ],
          ),
        ),
        childWhenDragging: Container(
          height: 86,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25, right: 10),
                child: Text(
                  widget.time.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    // If the message is not from the user
    else {
      // Check if the message has an icon
      if (widget.icon) {
        // Return a message with an icon
        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  child: Text(
                    widget.person,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 90),
                )
              ]),
              Row(children: <Widget>[
                FlatButton(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/Partying.png'),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Show a dialog with an icon when pressed
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.only(top: 150, left: 0, right: 0, bottom: 0),
                          backgroundColor: Colors.tealAccent,
                          content: Container(
                            alignment: Alignment.bottomCenter,
                            height: 75,
                            color: Colors.white,
                            child: Row(children: <Widget>[
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  child: Icon(Icons.person),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  child: Icon(Icons.person),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: radius,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.7,
                    minWidth: 20.0,
                  ),
                )
              ])
            ],
          ),
        );
      } else {
        // Return a message without an icon
        return Padding(
          padding: paddingNew,
          child: Column(
            crossAxisAlignment: align,
            children: <Widget>[
              Row(children: <Widget>[
                Text(
                  widget.person,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                  ),
                )
              ]),
              Row(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: radius,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.7,
                    minWidth: 20.0,
                  ),
                )
              ])
            ],
          ),
        );
      }
    }
  }
}
