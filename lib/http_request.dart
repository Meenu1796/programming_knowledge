import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPRequestExample extends StatefulWidget {
  @override
  _HTTPRequestExampleState createState() => _HTTPRequestExampleState();
}

class _HTTPRequestExampleState extends State<HTTPRequestExample> {
  String response;
  bool _quoteController=false;

  Future<String> getKanye() async{
    try{
      print('try block');
      var response=await http.get(Uri.https('api.kanye.rest', ''));
      //print(response.body);
      var result=json.decode(response.body);
      return result['quote'];
    } catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    //the function is called, then returned result is stored in a variable
    //it might create an error because it takes time to fetch data from the server and
    // print it. even though we use 'await', the execution of other code won't stop/block
    //using 'await' always is not recommended. instead use a condition check with ternary operator
    //even if we got the response from the api call, we must notify the build()
    // in order to stop the loader (ie. use setState())
    //error : if we use setState() inside build(), it keep rendering and rendering and rendering...
    // To avoid this, use a boolean check condition
    getKanye().then((value) {
      if(!_quoteController) {
        _quoteController=true;
      setState(() {
        response=value;
      });
    }
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.lightGreenAccent,
            child: (response == null) ? CircularProgressIndicator() : Text(response),
          ),
        ),
      ),
    );
  }
}
