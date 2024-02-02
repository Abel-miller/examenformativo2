import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_parcial_2/providers/taskProvider.dart';
import 'package:examen_parcial_2/vista/taskListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Lista de Tareas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // Cambia este color al que desees
            ),
          ),
        ),
        home: TaskListScreen(),
      ),
    );
  }
}
