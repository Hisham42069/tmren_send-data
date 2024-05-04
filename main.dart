import 'package:flutter/material.dart'; // Import the Flutter Material library
import 'dart:io'; // Import the Dart IO library for platform specific functionality
import 'package:flutter/services.dart';
import 'package:tmren/second.dart'; // Import the Flutter Services library for accessing platform services


void main() { // Define the main function
  runApp(MaterialApp(home: MyApp(),),
  ); // Run the application with MyApp as the root widget
}

class MyApp extends StatelessWidget { // Define a StatelessWidget named MyApp
  final userController = TextEditingController(); // Define a controller for the username text field
  final passController = TextEditingController(); // Define a controller for the password text field
  final showController = TextEditingController();

  MyApp({super.key}); // Define a controller for showing login information

  @override
  Widget build(BuildContext context) { // Override the build method to build the UI
    return Scaffold( // Scaffold widget for the app's layout structure
        appBar: AppBar( // App bar for the scaffold
          backgroundColor: Colors.green, // Set app bar background color
          centerTitle: true, // Center the title of the app bar
          title: const Text('Flutter project'), // Set the title of the app bar
        ),
        backgroundColor: Colors.grey, // Set the background color of the scaffold
        body: Column( // Column widget for arranging widgets vertically
          children: [ // List of children widgets for the column
            Container( // Container widget for holding the text and image with a blue background
              color: Colors.blue, // Set the background color of the container
              child: Row( // Row widget for arranging widgets horizontally
                children: [ // List of children widgets for the row
                  const Expanded( // Expanded widget to make the text flexible
                    child: Padding( // Padding widget to add padding around the text
                      padding: EdgeInsets.all(10.0), // Set padding to 10 pixels on all sides
                      child: Text( // Text widget to display text
                        "flutter image", // Text content
                        style: TextStyle( // Text style
                          fontSize: 20, // Set font size to 20
                          fontWeight: FontWeight.bold, // Set font weight to bold
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ),
                  Image.asset( // Image widget to display an image from assets
                    'assets/mendy.png', // Image path
                    height: 50, // Set image height
                    width: 50, // Set image width
                    fit: BoxFit.cover, // Ensure the image stretches to fill the available space
                  ),
                ],
              ),
            ),
            Container( // Container widget for holding the username text field
              margin: const EdgeInsets.all(10.0), // Set margin for the container
              padding: const EdgeInsets.all(10.0), // Set padding for the container
              color: Colors.redAccent, // Set background color of the container
              child: TextField( // Text field widget for entering username
                controller: userController, // Set controller for the text field
                keyboardType: TextInputType.name, // Set keyboard type to name
                decoration: const InputDecoration( // Input decoration for the text field
                  filled: true, // Fill the text field background
                  fillColor: Color.fromARGB(255, 255, 255, 255), // Set background color
                  hintText: 'Username', // Set hint text
                  hintStyle: TextStyle( // Hint text style
                    color: Colors.black, // Set hint text color
                    fontSize: 20, // Set hint text font size
                  ),
                  border: OutlineInputBorder( // Border for the text field
                    borderRadius: BorderRadius.all(Radius.circular(30.0)), // Set border radius
                  ),
                ),
              ),
            ),
            Container( // Container widget for holding the password text field
              margin: const EdgeInsets.all(10.0), // Set margin for the container
              padding: const EdgeInsets.all(10.0), // Set padding for the container
              color: Colors.redAccent, // Set background color of the container
              child: TextFormField( // Text form field widget for entering password
                controller: passController, // Set controller for the text field
                decoration:  const InputDecoration( // Input decoration for the text field
                  labelText: 'Enter your password', // Set label text
                  labelStyle: TextStyle( // Label text style
                    color: Colors.black, // Set label text color
                    fontSize: 20, // Set label text font size
                  ),
                  filled: true, // Fill the text field background
                  fillColor: Colors.white, // Set background color
                  border: OutlineInputBorder( // Border for the text field
                    borderRadius: BorderRadius.all(Radius.circular(30.0)), // Set border radius
                  ),
                ),
              ),
            ),
            Container( // Container widget for holding the login buttons
              margin: const EdgeInsets.all(10.0), // Set margin for the container
              padding: const EdgeInsets.all(15), // Set padding for the container
              color: Colors.brown, // Set background color of the container
              child: Center( // Center widget to center the row of buttons
                child: Row( // Row widget for arranging buttons horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                  children: [ // List of children widgets for the row
                    FloatingActionButton.extended( // Floating action button for login
                      onPressed: () { // Callback function for button press
                        showController.text = userController.text.toString(); // Update showController with username
                        showController.text += "  ---   "; // Add separator
                        showController.text += passController.text.toString(); // Update showController with password
                        String username = userController.text;
                        String password = passController.text;

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (v){
                           return Second(username: username,
                             password: password,);
                          })
                        );
                      },
                      label: const Text("Login"), // Set button label
                      backgroundColor: const Color.fromARGB(200, 000, 000, 200), // Set button background color
                    ),
                    FloatingActionButton.extended( // Floating action button for clearing fields
                      onPressed: () { // Callback function for button press
                        showController.text = ''; // Clear showController
                        userController.text = ''; // Clear username field
                        passController.text = ''; // Clear password field
                      },
                      label: const Text("Clear"), // Set button label
                      backgroundColor: const Color.fromARGB(200, 000, 000, 200), // Set button background color
                    ),
                    FloatingActionButton.extended( // Floating action button for closing app
                      onPressed: () { // Callback function for button press
                        if (Platform.isAndroid) { // Check if platform is Android
                          SystemNavigator.pop(); // Close app using system navigator
                          SystemChannels.platform.invokeMethod('SystemNavigator.pop'); // Close app using platform channel
                          exit(0); // Exit app
                        } else if (Platform.isIOS) { // Check if platform is iOS
                          exit(0); // Exit app
                        }
                      },
                      label: const Text("Close"), // Set button label
                      backgroundColor: const Color.fromARGB(200, 000, 000, 200), // Set button background color
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}
