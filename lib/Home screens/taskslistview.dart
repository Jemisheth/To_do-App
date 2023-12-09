// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todolist extends StatefulWidget {
  final String taskname;
  final String tskdesdription;
  final bool tskcomp;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetask;
  Function(String)? onEdit;

  todolist({
    super.key,
    required this.taskname,
    required this.tskdesdription,
    required this.tskcomp,
    required this.onChanged,
    required this.deletetask,
    required this.onEdit,
  });

  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  TextEditingController _editController = TextEditingController();

  void _editTask() {
    String editedTaskName = _editController.text;
    widget.onEdit?.call(editedTaskName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 22, right: 22),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deletetask,
              icon: Icons.delete,
              label: "Delete the task",
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.tskcomp,
                onChanged: widget.onChanged,
                activeColor: Colors.blue.shade800,
              ),
              Text(
                widget.taskname,
                semanticsLabel: widget.tskdesdription,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: widget.tskcomp
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blue,
                                title: const Text('Edit Task'),
                                content: TextField(
                                  controller: _editController,
                                  decoration: InputDecoration(
                                    hintText: widget.taskname,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      _editTask();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
