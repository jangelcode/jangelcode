import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Define a stateful widget for the Phone Code screen
class PhoneCode extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define the state for the Phone Code widget
class _MyCustomFormState extends State<PhoneCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with an app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Body of the Phone Code screen
      body: Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              // Title for the Phone Code screen
              Text('Login Code',
                style: TextStyle(
                  fontSize: 20,
                )),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              // Display phone number and provide a link to go back
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text('Enter the Code sent to ',
                    style:TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  InkWell(
                    child:Text('(123)456-7890',
                      style:TextStyle(
                        fontSize: 16, 
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        color: Colors.blue
                      )
                    ),
                    onTap: ()=>Navigator.pop(context),
                  )
                ]
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              // Text field for entering the verification code
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Code',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),),
              // Button to verify the entered code
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.blue),
                height: 50,
                width: 200,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                  child: Text('Verify',style: TextStyle(color:Colors.white,)),
                  color: Colors.blue[400],
                  elevation: 5,
                  onPressed:(){
                    Navigator.pushNamed(context, '/Chats');
                  },
                )
              )
            ]
          ),
        )
      )
    ]
  )
);
}
}
