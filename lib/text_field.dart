import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programming_knowledge/container.dart';
import 'package:toast/toast.dart';

class TextFieldExample extends StatefulWidget {
  @override
  _TextFieldExampleState createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  var _textController;
  var _readOnly;
  @override
  void initState() {
    super.initState();
    _textController=TextEditingController();
    _readOnly=TextEditingController();
    //set a pre-set value
    _textController.text='Flutter';
    _readOnly.text='Read Only Text';

  }

  @override
  void dispose() {
    _textController.dispose();
    _readOnly.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField'),),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              //focus this widget when the page open
              autofocus: false, //default-false
              autocorrect: true,
              //to retrieve data from edittext
              controller: _textController,
                //enable to type text or change the value
              enabled: true, //default-true
              //if long-press on the text, the entire text will get selected
              // (visible options like cut/copy/select)
              enableInteractiveSelection: true,
              //show suggested input values
              enableSuggestions: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //padding for text
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Colors.green
                  )
                ),
                //displays when the field is not selected or lost focus
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Colors.amber
                    )
                ),
                //displays when an error in text field
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.red
                  )
                ),
                //background color for text field
                fillColor: Colors.green[200],
                //must specify with fillColor to fill the entire background
                filled: true,
                labelText: 'This is a label text',
                labelStyle: TextStyle(
                    color: Colors.purple
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              //display dotted hidden password property
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'This is a hint text',
                //style the hint text
                hintStyle: TextStyle(
                  color: Colors.pink[900]
                ),
                icon: Icon(Icons.lock)
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'pre-fix text and pre-fix icon',
                prefixText: 'Pre-fix text',
                prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'suffix-fix text and suffix-fix icon',
                  suffixText: 'suffix-fix text',
                  suffixIcon: Icon(Icons.person)
              ),
            ),
            //button press methods
            TextField(
              keyboardType: TextInputType.name,
              //when a new character add/remove from the original/new text
              onChanged: (value) {
                print(value);
                Toast.show('onChanged'+value,context,duration: Toast.LENGTH_SHORT); },
              //trigger when we finish typing and move to next text-field/submit/press enter
              onEditingComplete: () {
                print('onEditingComplete');
                Toast.show('onEditingComplete',context,duration: Toast.LENGTH_SHORT); },
              //same as onEditingComplete except having onChanged property
              // to print the inputted text
              onSubmitted: (value) {
                print(value);
              },
              onTap: () {
                print('I just got a tap');
              },
              //trigger when we click the tick button on the keyboard.
              // ex: execute a search query
              textInputAction: TextInputAction.search,
              //direction of text when we type it
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'press methods and text-decoration',
                helperText: 'This is a helper text'
              ),
            ),
            TextField(
              controller: _readOnly,
              //same as enabled
              readOnly: true,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center, //works horizontally
              textAlignVertical: TextAlignVertical.bottom, //works vertically
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => print(_textController.text),),
    );
  }
}
