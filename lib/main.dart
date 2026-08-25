import 'package:flutter/material.dart';
import 'package:homework6/screens/home/homePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme:  ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // textStyle: TextStyle(color:  Color.fromARGB(255, 48, 192, 19)),
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.white,
            
          ),
          
        ),
      ),
      home: Homepage()
    );
  }
}
