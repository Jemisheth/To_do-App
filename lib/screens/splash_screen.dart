// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/Home%20screens/home_page.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                'TO DO APP',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              color: Colors.blue.shade200,
              child: Lottie.asset("assets/todolist.json"),
            ),
          ],
        ),
      ),
    );
  }
}
