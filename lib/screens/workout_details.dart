import 'package:flutter/material.dart';
import 'package:fitguide/screens/workout.dart';
import '../utilities/utilities.dart';
import '../components/components.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailsScreen({
    super.key,
    required this.workout
  });

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
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
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20.0),

                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:15.0, left: 7.0, right: 7.0, bottom: 7.0),
                      child: Table(
                        columnWidths: const {
                          0 : FractionColumnWidth(0.4),
                          1 : FractionColumnWidth(0.2),
                          2 : FractionColumnWidth(0.2),
                          3 : FractionColumnWidth(0.2)
                        },
                        children: [
                          ...workout.exercises.map((exercise) {
                            return buildRow([
                              exercise.name,
                              exercise.sets.toString(),
                              exercise.reps.toString(),
                              exercise.duration.toString(),
                            ]);
                          }),
                        ],
                      ),
                    ),
                  ),
                ),    

                const SizedBox(height: 30.0),

                Center(
                  child: ButtonComponent(
                    backgroundColor: 'C80000'.toColor(opacity: 1.0),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutScreen()),
                      )
                    },
                    icon: null,
                    text: "Start Workout",
                    textColor: "FFFFFF".toColor(opacity: 1.0),
                    weight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10.0),

                Center(
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  )

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
    children: cells.map((cell) {
      final style = TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        color: Colors.white,
        fontSize: 12,
      );

      return Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
            cell,  // Use the current cell value
            style: style,
          ),
      );
    }).toList(), // Don't forget to convert the mapped Iterable to a List
  );
}
