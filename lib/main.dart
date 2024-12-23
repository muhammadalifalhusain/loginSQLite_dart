import 'package:flutter/material.dart';
import 'package:coba_dart/screens/login_screen.dart';
import 'package:coba_dart/screens/home_screen.dart';
import './models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Project',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(user: User(id: 0, username: 'Guest', authProvider: 'Unknown')), // Sesuaikan dengan User login
      },
    );
  }
}
