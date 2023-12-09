// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/Dbutton.dart';

class Dialogbox extends StatelessWidget {
  final txtcontroller;
  final txtcontroller1;
  VoidCallback save;
  VoidCallback cancel;

  Dialogbox({
    super.key,
    required this.txtcontroller,
    required this.txtcontroller1,
    required this.save,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade400,
      content: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TextField(
            //   controller: txtcontroller1,
            //   decoration: InputDecoration(
            //       hintText: "Title",
            //       hintStyle: const TextStyle(color: Colors.black),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide(
            //           width: 1.5,
            //           color: Colors.indigo.shade900,
            //         ),
            //       )),
            // ),
            // textfield for task name
            TextField(
              keyboardType: TextInputType.name,
              controller: txtcontroller,
              decoration: InputDecoration(
                  hintText: "Create a new task",
                  hintStyle: const TextStyle(color: Colors.black87),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.indigo.shade900,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DButtons(
                  text: "Add",
                  onPressed: save,
                ),
                const SizedBox(
                  width: 8,
                ),
                DButtons(
                  text: "Cancel",
                  onPressed: cancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 