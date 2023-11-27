import 'package:flutter/material.dart';
import 'conversation.dart';

// Define a stateful widget for the chat item
class ChatItem extends StatefulWidget {
  // Define properties needed for the chat item
  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;

  // Constructor to initialize the properties
  ChatItem({
    Key key,
    @required this.dp,
    @required this.name,
    @required this.time,
    @required this.msg,
    @required this.isOnline,
    @required this.counter,
  }) : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

// Define the state for the ChatItem widget
class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    // Build the chat item using ListTile
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        // Leading section with user avatar and online status
        leading: Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(
                "${widget.dp}",
              ),
              radius: 25,
            ),
            Positioned(
              bottom: 0.0,
              left: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 11,
                width: 11,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isOnline
                          ? Colors.greenAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 7,
                    width: 7,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Title section with the user's name
        title: Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: Text(
            "${widget.name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Subtitle section with the last message and 'Main Interests'
        subtitle: Container(
          width: 50,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 5,
                left: 5,
                child: Text("${widget.msg}"),
              ),
              Text('Main Interests'),
            ],
          ),
        ),
        // Trailing section with time, and unread messages counter if any
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              "${widget.time}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),
            SizedBox(height: 10, width: 10),
            widget.counter == 0
                ? SizedBox()
                : Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 11,
                      minHeight: 11,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 1, left: 5, right: 5),
                      child: Text(
                        '   ',
                        //"${widget.counter}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ],
        ),
        // Navigate to the conversation screen when tapped
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Conversation();
              },
            ),
          );
        },
      ),
    );
  }
}
