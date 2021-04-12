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
  List<Task> list;
  List<bool> _taskDone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController=TextEditingController();
    getPrefs();
     getTaskList();
  }
  void getPrefs() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
  }

  void getTaskList() async{
    list=[];
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String task=prefs.getString('task');
    List listTask=(task ==null)? [] : json.decode(task);
    print(listTask);
    for(dynamic d in listTask) {
      //we have encoded the data 2 times when we saved the data
      //so we have to decode the data when we retrieve the data
      list.add(Task.fromMap(json.decode(d)));
    }

    _taskDone=List.generate(list.length, (index) => false);
    setState(() {});
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _saveData() async {
    Task t=Task.fromTask(_taskController.text);
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String task=prefs.getString('task');
    print('1' + task);
    List list=(task == null) ? [] : json.decode(task);
    print('2 '+list.toString());
    //adding a new task to the existing list
    list.add(json.encode(t.getMap()));
    //saving new list to prefs
    prefs.setString('task', json.encode(list));
    _taskController.text='';
    print('3 '+json.encode(list));
    //close the bottom sheet
    Navigator.of(context).pop();
    getTaskList();
  }
  void _clearCompletedTask() async{
    if(list != null) {
      SharedPreferences pref=await SharedPreferences.getInstance();
      List<Task> pendingList=[];
      for(var i=0;i<list.length;i++)
        if(!_taskDone[i]) pendingList.add(list[i]);

      var pendingListEncoded=List.generate(
        //pendingList[index]  -> instance of class
        //pendingList[index].getMap() -> return Map data
        //json.encode(//...)  -> encode to json
          pendingList.length, (index) => json.encode(pendingList[index].getMap()));
      pref.setString('task', json.encode(pendingListEncoded));
      getTaskList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(
        'Task Manager',
        style: GoogleFonts.montserrat(),
      ),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () => _clearCompletedTask()),
          IconButton(icon: Icon(Icons.delete), onPressed: () async{
            SharedPreferences pref=await SharedPreferences.getInstance();
            pref.setString('task', json.encode([]));
            getTaskList();
          })
        ],
      ),
      body: (list == null || list == []) ? Center(
        child: Container(
          child: Text('No actions added yet',
          style: GoogleFonts.montserrat(),
          ),
    ),
      ) : SingleChildScrollView(
        child: Column(
          children: list.map((e) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0
              ),
              padding : const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.blue,
                  width: 0.5,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.task,style: GoogleFonts.montserrat(),),
                  Checkbox(
                    key: GlobalKey(),
                      value: _taskDone[list.indexOf(e)],
                      onChanged: (newValue) {
                        setState(() {
                          _taskDone[list.indexOf(e)]=newValue;
                        });
                  })
                ],
              ),
            );
          }).toList(),
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
                            onPressed: () => _saveData(),
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
