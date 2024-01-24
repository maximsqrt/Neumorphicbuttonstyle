import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}


class Logger {
  static void t(String message) {
    developer.log(message, name: 'TRACE', time: DateTime.now());
  }

  static void d(String message) {
    developer.log(message, name: 'DEBUG', time: DateTime.now());
  }

  static void i(String message) {
    developer.log(message, name: 'INFO', time: DateTime.now());
  }

  static void w(String message) {
    developer.log(message, name: 'WARNING', time: DateTime.now());
  }

  static void e(String message, {String error = ''}) {
    developer.log('$message\n$error', name: 'ERROR', time: DateTime.now());
  }

  static void f(String message, {String error = '', StackTrace? stackTrace}) {
    developer.log('$message\n$error\n$stackTrace', name: 'FATAL', time: DateTime.now());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFA6CFD5), // AppBar background color
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _handlePrint() {
    Logger.t('Normal Print');
  }

  void _handleDebugPrint() {
    Logger.d('Debug Print');
  }

  void _handleLogPrint() {
    Logger.i('Log Print');
  }
Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F084B), // Dark color
            Color(0xFF26408B), // Medium color
            Color(0xFFA6CFD5), // Light color
          ],
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton(
  Color buttonColor, String label, VoidCallback onPressed) {
return Container(
  margin: EdgeInsets.all(10),
  child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      primary: Colors.transparent,
    ),
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            buttonColor.withOpacity(0.9), // Dark color
            buttonColor.withOpacity(0.5), // Light color
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(5, 5),
            blurRadius: 15,
            spreadRadius: 3,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: Offset(-5, -5),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    ),
  ),
);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neumorphic Buttons'),
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNeumorphicButton(
                  Color(0xFF0F084B),
                  'Print',
                  _handlePrint,
                ),
                _buildNeumorphicButton(
                  Color(0xFF26408B),
                  'Debug Print',
                  _handleDebugPrint,
                ),
                _buildNeumorphicButton(
                  Color(0xFFA6CFD5),
                  'Log Print',
                  _handleLogPrint,
                ),
                _buildNeumorphicButton(
                  Color(0xFFC2E7D9),
                  'Another Button',
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
