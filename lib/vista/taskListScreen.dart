import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_parcial_2/providers/taskProvider.dart';
import 'package:examen_parcial_2/modelo/task.dart';
import 'package:examen_parcial_2/vista/tastCreateScreen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Elimina el título para evitar duplicados
        title: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contenedor para centrar el texto "Lista de Tareas"
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Lista de Tareas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16), // Espaciado opcional

                  // Botón para navegar a la pantalla de agregar/editar tarea
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditTaskScreen(),
                        ),
                      );
                    },
                    child: Text('Entrar'),
                  ),
                ],
              ),
            ),

            // Tu lista de tareas
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  return ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.tasks[index];
                      return ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                            color: task.isCompleted ? Colors.green : null,
                          ),
                        ),
                        subtitle: Text(
                          task.description,
                          style: TextStyle(
                            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                            color: task.isCompleted ? Colors.green : null,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                                color: task.isCompleted ? Colors.green : null,
                              ),
                              onPressed: () {
                                final updatedTask = Task(
                                  title: task.title,
                                  description: task.description,
                                  isCompleted: !task.isCompleted,
                                );
                                taskProvider.updateTask(index, updatedTask);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _showDeleteConfirmationDialog(context, index);
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navegar a la pantalla de agregar/editar tarea
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditTaskScreen(task: task),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar Tarea'),
          content: Text('¿Estás seguro de que quieres eliminar esta tarea?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false).removeTask(index);
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
