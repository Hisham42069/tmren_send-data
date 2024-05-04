import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final String username;
  final String password;

  const Second({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: ${widget.username}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Password: ${widget.password}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
