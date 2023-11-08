import 'package:fitguide/components/components.dart';
import 'package:flutter/material.dart';
import 'package:fitguide/utilities/utilities.dart';

class TestScreen extends StatefulWidget{
  const TestScreen({
    super.key,
  });
  @override
  State<TestScreen> createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const LogoComponent(
          fontSize: 20.0,
        ),
        backgroundColor: '040404'.toColor(opacity: 1.0),
      ),

      backgroundColor: '040404'.toColor(opacity: 1.0),

      body: const Center(
        child: Text(
          "Hello Wrld",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}