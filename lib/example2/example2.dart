import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programming_knowledge/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Example2 extends StatefulWidget {
  static const routeName='/example2';

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  var _taskController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController=TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _saveData() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    Task t=Task.fromTask(_taskController.text);
    String task=prefs.getString('task');
    List list=(task == null) ? [] : json.decode(task);
    //adding a new task to the existing list
    list.add(json.encode(t.getMap()));
    //saving new list to prefs
    prefs.setString('task', json.encode(list));
    _taskController.text='';
    print(json.encode(list));
    //close the bottom sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(
        'Task Manager',
        style: GoogleFonts.montserrat(),
      ),
      ),
      body: Center(
        child: Container(
          child: Text('No actions added yet',
          style: GoogleFonts.montserrat(),
          ),
    ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blue[700],
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              height: 200.0,
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueAccent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Add Task',style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20.0
                        ),),
                        //onTap function for Icon
                        GestureDetector(
                          //close the bottom sheet
                          onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.cancel_outlined,color: Colors.white,))
                      ],
                    ),
                    Divider(thickness: 2.0,color: Colors.white,),
                    SizedBox(height: 10.0,),
                    TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter task',
                        hintStyle: GoogleFonts.montserrat()
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: Colors.white,
                            textColor: Colors.blue,
                            child : Text('Reset',style: GoogleFonts.montserrat(),),
                          onPressed: () => _taskController.text='',
                        ),
                        RaisedButton(
                            color: Colors.white,
                            textColor: Colors.blue,
                            onPressed: () => _saveData,
                            child : Text('Add',style: GoogleFonts.montserrat(),))
                      ],
                    )
                  ],
                ),
              ),

            );
          });
        },
      ),
    );
  }
}
