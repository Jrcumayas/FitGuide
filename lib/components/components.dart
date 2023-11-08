import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../utilities/utilities.dart';

import 'package:fitguide/screens/login.dart';
import 'package:fitguide/screens/home.dart';
import 'package:fitguide/screens/profile.dart';
import 'package:fitguide/screens/workout_details.dart';

var logger = Logger();

class Exercise {
  final String name;
  final int sets;
  final int reps;
  final int duration;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.duration,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      sets: json['sets'],
      reps: json['reps'],
      duration: json['duration'],
    );
  }
}

class Workout {
  final String name;
  final String description;
  final String imagePath;
  final List<Exercise> exercises;

  Workout({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.exercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    var exercisesJson = json['exercises'] as List<dynamic>;
    List<Exercise> exercises = exercisesJson.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList();

    return Workout(
      name: json['name'],
      description: json['description'],
      imagePath: json['image'],
      exercises: exercises, // Add this line
    );
  }
}

class LogoGroupComponent extends StatelessWidget {
  const LogoGroupComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LogoComponent(fontSize: 45.0),
        SizedBox(height: 5.0),
        TagLineComponent()
      ],
    );
  }
}

class LogoComponent extends StatelessWidget{
  static const String fitText = "FIT";
  static const String guideText = "GUIDE";
  final double fontSize;

  const LogoComponent ({
    super.key,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          letterSpacing: 3.0,
        ),
        children: [
          TextSpan(
            text: fitText,
            style: TextStyle(
              color: 'C80000'.toColor(opacity: 1.0),
            ),
          ),
          TextSpan(
            text: guideText,
            style: TextStyle(
              color: 'FFFFFF'.toColor(opacity: 1.0),
            ),
          ),
        ],
      ),
    ); 
  }
}

class TagLineComponent extends StatelessWidget{
  const TagLineComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText("Empowering Fitness,", 70.0),
        buildText("One Form at a Time", 65.0),
      ],
    );
  }

  Widget buildText(String text, double leftPadding) {
    return Container(
      padding: EdgeInsets.only(left: leftPadding),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100 ,
          color: Colors.white,
        ),
      ),
    );
  }
}

class TextFieldComponent extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;

  const TextFieldComponent({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set the desired border radius here
        color:'D9D9D9'.toColor(opacity: 0.3), // Set the background color of the TextField
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: InputBorder.none, // Remove the default border of TextField
        ),
        obscureText: obscureText, // Hide the password characters
      ),
    );
  }
}

class ButtonComponent extends StatelessWidget {
  final Function()? onTap;
  final Icon? icon;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final FontWeight weight;
  final TextAlign textAlign; // New field for text alignment

  const ButtonComponent({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.weight,
    this.textAlign = TextAlign.center, // Default text alignment is center
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      height: 45,
      child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        textAlign: textAlign, // Set the text alignment based on the provided value
        style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 15.0,
        ),
        children: [
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: 'C80000'.toColor(opacity: 1.0),
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: ' an account',
            style: TextStyle(
              color: 'FFFFFF'.toColor(opacity: 1.0),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarComponent extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigationBarComponent({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {
  void _onItemTapped(int index) {
    if (index != widget.selectedIndex) {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(Icons.home),
            color: (widget.selectedIndex == 0) ? Colors.red : Colors.white.withOpacity(1.0),
            onPressed: () {
              _onItemTapped(0);
            },
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(Icons.search),
            color: (widget.selectedIndex == 1) ? Colors.red : Colors.white.withOpacity(1.0),
            onPressed: () {
              _onItemTapped(1);
            },
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: const Icon(Icons.person),
            color: (widget.selectedIndex == 2) ? Colors.red : Colors.white.withOpacity(1.0),
            onPressed: () {
              _onItemTapped(2);
            },
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      showSelectedLabels: false, // Show labels for the selected item
      showUnselectedLabels: false,
      backgroundColor: '040404'.toColor(opacity: 1.0),
    );
  }
}

class DisplayWorkoutComponent extends StatelessWidget{
  final List<Workout> workouts;

  const DisplayWorkoutComponent({
    super.key, 
    required this.workouts,
  });

  @override
  Widget build(BuildContext context){
    return SizedBox( 
      width: MediaQuery.of(context).size.width - 46,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: workouts.map((workout) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  logger.i('Selected');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutDetailsScreen(workout: workout),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove extra padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                child: Container(
                  height: 130,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3),
                    image: DecorationImage(
                      image: AssetImage(workout.imagePath), // Use the assetImagePath from the Exercise object
                      fit: BoxFit.cover, // Set the BoxFit property to adjust how the image is displayed within the container.
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        workout.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}