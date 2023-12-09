// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/Home%20screens/taskslistview.dart';
import 'package:to_do_app/screens/Database/database.dart';
import 'package:to_do_app/screens/dialogbox.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  // reference the box here
  final _mybox = Hive.box('mybox');

  @override
  void initState() {
    super.initState();

    if (_mybox.get("TODOLIST") == null ) {
      db.createInitialData();
    } else {
      db.loadata();
    }
  }

  // text controller for creating the new tasks...
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  // final _ttlcontroller = TextEditingController();

  database db = database();
  

  void enabledcheckbox(bool? value, int index) {
    setState(() {
      db.todolists[index][1] = !db.todolists[index][1];
    });
    db.updatedata();
  }

  void addtask() {
    setState(() {
      db.todolists.add([_controller.text, false]);
      // db.todolists.add([_controller1.text, false]);
      _controller.clear();
      // _controller1.clear();
    });
    db.updatedata();
    Navigator.of(context).pop();
  }

  // for creating the new tasks
  void newtask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            txtcontroller1: _controller1,
            txtcontroller: _controller,
            save: addtask,
            cancel: () => Navigator.of(context).pop(),
          );
        });
        db.updatedata();
  }

  void taskdel(int index) { 
    setState(() {
      db.todolists.removeAt(index);
    });
    db.updatedata();
  }
  
  void editTask(int index, String editedTaskName) {
  setState(() {
    db.todolists[index][0] = editedTaskName;
  });
  db.updatedata();
}

  @override
  Widget build(BuildContext context) {
    // this variable is used for dark mode and light mode...
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: buildAppbar(isdark),
      body: ListView.builder(
        itemCount: db.todolists.length,
        itemBuilder: (context, index) {
          return todolist(
            taskname: db.todolists[index][0],
            tskdesdription: db.todolists[index][0],
            tskcomp: db.todolists[index][1],
            onEdit: (editedTaskName) => editTask(index, editedTaskName),
            onChanged: (value) => enabledcheckbox(value, index),
            deletetask: (context) => taskdel(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade400,
        onPressed: newtask,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget searchbox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 17.0,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.blue.shade400,
      ),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 32,
            ),
            border: InputBorder.none,
            hintText: 'Search the tasks',
            hintStyle: TextStyle(color: Colors.black87)),
      ),
    );
  }

  AppBar buildAppbar(bool isdark) {
    return AppBar(
      title: const Text("To-do App"),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(isdark ? Icons.sunny : Icons.brightness_3),
        ),
      ],
    );
  }
}