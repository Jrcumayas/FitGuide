import 'dart:convert';
import 'package:fitguide/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/utilities.dart';
import 'dart:core';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final int _selectedIndex = 0;

  List<Workout> workouts = [];
  List<Workout> customs = [];

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  Future<void> loadExercises() async {
    String jsonData = await rootBundle.loadString('lib/assets/local_data/workouts.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Workout> loadedWorkout = jsonList.map((json) => Workout.fromJson(json)).toList();

    String jsonData2 = await rootBundle.loadString('lib/assets/local_data/customs.json');
    List<dynamic> jsonList2 = json.decode(jsonData2);
    List<Workout> loadedCustom = jsonList2.map((json) => Workout.fromJson(json)).toList();
    setState(() {
      workouts = loadedWorkout;
      customs = loadedCustom;
    });
  } 

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

      body: SafeArea(
        child: Stack( // Use Stack to layer the widgets
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [

                    // Full Body Workout
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0), // Adjust the value of left as needed
                          child: Text(
                            "Full Body Workout",
                            style: TextStyle(
                              color: 'FFFFFF'.toColor(opacity: 1.0),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20.0),

                    DisplayWorkoutComponent(workouts: workouts),

                    const SizedBox(height: 20.0),
                    // Custom Workout
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0), // Adjust the value of left as needed
                          child: Text(
                            "Custom Workout",
                            style: TextStyle(
                              color: 'FFFFFF'.toColor(opacity: 1.0),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20.0),

                    DisplayWorkoutComponent(workouts: customs),
                  ]
                )
              ),
            ), 
          ], 
        ),
      ), 
      bottomNavigationBar: BottomNavigationBarComponent(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}