import 'package:fitguide/components/components.dart';
import 'package:flutter/material.dart';
import 'package:fitguide/utilities/utilities.dart';

class WorkoutScreen extends StatefulWidget{
  const WorkoutScreen({
    super.key,
  });
  @override
  State<WorkoutScreen> createState() => _WorkoutScreen();
}

class _WorkoutScreen extends State<WorkoutScreen>{
  int pushUpCount = 0;
  int squatCount = 0;
  int jumpingJackCount = 0;

  void increaseCount(String exercise) {
    setState(() {
      switch(exercise) {
        case 'pushUp':
          pushUpCount++;
          break;
        case 'squat':
          squatCount++;
          break;
        case 'jumpingJack':
          jumpingJackCount++;
          break;
      }
    });
  }

  void decreaseCount(String exercise) {
    setState(() {
      switch(exercise) {
        case 'pushUp':
          if(pushUpCount > 0) pushUpCount--;
          break;
        case 'squat':
          if(squatCount > 0) squatCount--;
          break;
        case 'jumpingJack':
          if(jumpingJackCount > 0) jumpingJackCount--;
          break;
      }
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ExerciseCounter(
            exerciseName: 'Push Ups',
            count: pushUpCount,
            onIncrease: () => increaseCount('pushUp'),
            onDecrease: () => decreaseCount('pushUp'),
          ),
          ExerciseCounter(
            exerciseName: 'Squats',
            count: squatCount,
            onIncrease: () => increaseCount('squat'),
            onDecrease: () => decreaseCount('squat'),
          ),
          ExerciseCounter(
            exerciseName: 'Jumping Jacks',
            count: jumpingJackCount,
            onIncrease: () => increaseCount('jumpingJack'),
            onDecrease: () => decreaseCount('jumpingJack'),
          ),
        ],
      ),
    );
  }
}

class ExerciseCounter extends StatelessWidget {
  final String exerciseName;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ExerciseCounter({
    required this.exerciseName,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          exerciseName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: onDecrease,
              child: Icon(Icons.remove),
            ),
            Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              onPressed: onIncrease,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}