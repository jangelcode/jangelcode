import 'dart:math';
import 'package:flutter/material.dart';

// Define a stateful widget for the chat bubble
class ChatBubble extends StatefulWidget {
  // Define properties needed for the chat bubble
  final String message, time, username, type, replyText, replyName;
  final bool isMe, isGroup, isReply;

  // Constructor to initialize the properties
  ChatBubble({
    @required this.message,
    @required this.time,
    @required this.isMe,
    @required this.isGroup,
    @required this.username,
    @required this.type,
    @required this.replyText,
    @required this.isReply,
    @required this.replyName});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

// Define the state for the ChatBubble widget
class _ChatBubbleState extends State<ChatBubble> {
  // Generate a random number for selecting a color from the list of primaries
  List colors = Colors.primaries;
  static Random random = Random();
  int rNum = random.nextInt(18);

  @override
  Widget build(BuildContext context) {
    // Determine background color, alignment, and border radius based on whether it's the user's message or not
    final bg = widget.isMe ? Theme.of(context).accentColor : Colors.grey[200];
    final align = widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = widget.isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          );

    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        // Container for the chat bubble
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: radius,
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.3,
            minWidth: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Display username for group chats
              widget.isMe
                  ? SizedBox()
                  : widget.isGroup
                      ? Padding(
                          padding: EdgeInsets.only(right: 48.0),
                          child: Container(
                            child: Text(
                              widget.username,
                              style: TextStyle(
                                fontSize: 13,
                                color: colors[rNum],
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        )
                      : SizedBox(),
              widget.isGroup ? widget.isMe ? SizedBox() : SizedBox(height: 5) : SizedBox(),

              // Display the reply container if it's a reply message
              widget.isReply
                  ? Container(
                      decoration: BoxDecoration(
                        color: !widget.isMe ? Colors.grey[50] : Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      constraints: BoxConstraints(
                        minHeight: 25,
                        maxHeight: 100,
                        minWidth: 80,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Display reply username
                            Container(
                              child: Text(
                                widget.isMe ? "You" : widget.replyName,
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),

                            SizedBox(height: 2),

                            // Display reply text
                            Container(
                              child: Text(
                                widget.replyText,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                maxLines: 2,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(width: 2),

              widget.isReply ? SizedBox(height: 5) : SizedBox(),

              // Display the actual message (text or image)
              Padding(
                padding: EdgeInsets.all(widget.type == "text" ? 5 : 0),
                child: widget.type == "text"
                    ? !widget.isReply
                        ? Text(
                            widget.message,
                            style: TextStyle(
                              color: widget.isMe ? Colors.white : Colors.black,
                            ),
                          )
                        : Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.message,
                              style: TextStyle(
                                color: widget.isMe ? Colors.white : Colors.black,
                              ),
                            ),
                          )
                    : Image.asset(
                        "${widget.message}",
                        height: 130,
                        width: MediaQuery.of(context).size.width / 1.3,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
        ),

        // Display the message timestamp
        Padding(
          padding: widget.isMe
              ? EdgeInsets.only(right: 10, bottom: 10.0)
              : EdgeInsets.only(left: 10, bottom: 10.0),
          child: Text(
            widget.time,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
