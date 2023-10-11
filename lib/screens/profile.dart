import 'package:flutter/material.dart';
import '../components/components.dart';
import '../utilities/utilities.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const LogoComponent(
            fontSize: 20.0,
          ),
          backgroundColor: '040404'.toColor(opacity: 1.0),
        ),
        backgroundColor: '040404'.toColor(opacity: 1.0),
        body: const Center (
          child: Column(
          children: [
              SizedBox(height: 50.0),

              Align(
                alignment: Alignment.centerLeft, // You can also use Alignment.centerLeft here
                child: ButtonComponent(
                  onTap: null,
                  icon: null,
                  backgroundColor: Colors.transparent,
                  text: 'Account',
                  textColor: Colors.white,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.left,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft, // You can also use Alignment.centerLeft here
                child: ButtonComponent(
                  onTap: null,
                  icon: null,
                  backgroundColor: Colors.transparent,
                  text: 'Notifications',
                  textColor: Colors.white,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.left,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft, // You can also use Alignment.centerLeft here
                child: ButtonComponent(
                  onTap: null,
                  icon: null,
                  backgroundColor: Colors.transparent,
                  text: 'Appearance',
                  textColor: Colors.white,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.left,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft, // You can also use Alignment.centerLeft here
                child: ButtonComponent(
                  onTap: null,
                  icon: null,
                  backgroundColor: Colors.transparent,
                  text: 'About',
                  textColor: Colors.white,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.left,
                ),
              ),
            
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarComponent(
          selectedIndex: _selectedIndex,
        ),
      )
    );
  }
}