import 'package:flutter/material.dart';
import 'package:fitguide/components/functions.dart';
import '../components/components.dart';
import '../utilities/utilities.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  //Controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to release resources
    usernameController.dispose();
    passwordController.dispose();
    
    super.dispose(); // Call the dispose method of the parent class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '040404'.toColor(opacity: 1.0),
      body: SafeArea(
        child: Stack( // Use Stack to layer the widgets
          children: [
            Positioned.fill( // Position the image to fill the entire screen
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Image.asset(
                  'lib/assets/images/login/login_image.png',
                  fit: BoxFit.none,
                ),
              ),
            ),

            Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoGroupComponent(),
                  const SizedBox(height: 80.0),

                  // Username
                  Align (
                    alignment: Alignment.center,
                    child: TextFieldComponent(
                      controller: usernameController,
                      hintText: 'Username',
                      prefixIcon: const Icon(Icons.person),
                      obscureText: false,
                    ),
                  ),
                
                  const SizedBox(height: 10.0),

                  // Password textbox
                  Align (
                    alignment: Alignment.center,
                    child: TextFieldComponent(
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 140.0),
                      child: TextButton(
                        onPressed: () {
                          // Add "Forgot your password" button functionality here
                        },
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            color: 'FFFFFF'.toColor(opacity: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18.0),

                  // Login button
                  ButtonComponent(
                    onTap: () {
                      if (LoginInputValidation.checkInput(usernameController.text, passwordController.text)){
                        dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        ); 
                      } else {
                        print("Fill in the necessary details.");
                      }
                    },
                    icon: null,
                    backgroundColor: 'FFFFFF'.toColor(opacity: 1.0),
                    text: 'Login',
                    textColor: '000000'.toColor(opacity: 1.0),
                    weight: FontWeight.bold,
                  ),

                  const SizedBox(height: 10.0),

                  TextButton(
                    onPressed: () {
                    },
                    child: const TextButtonComponent(),
                  ),
                ],
              ),
            ), 
          ], 
        ),
      ),
    );
  }
}