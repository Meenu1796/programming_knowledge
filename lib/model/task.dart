import 'package:flutter/foundation.dart';

class Task {
  String task;
  DateTime time;

  Task({this.task, this.time});

  //saving data to variables by calling an instance of the class using factory keyword
  factory Task.fromTask(String task) {
    return Task(
      task: task,
      time: DateTime.now()
    );
  }

  factory Task.fromMap(Map<String,dynamic> map) {
    return Task(
      task: map['task'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time'])
    );
  }

  //passing the data as map to save to shared preferences
  Map<String,dynamic> getMap() {
    return {
      'task' :this.task,
      'time':this.time.millisecondsSinceEpoch,
    };
  }
}