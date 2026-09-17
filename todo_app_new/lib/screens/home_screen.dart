import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> _tasks = [];

  //lets define a simple function to add a new task
  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
  }

  //now lets define a function to toggle the task state
  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  //lets define a function to delete a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  //lets build the  UI of our application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo-List App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTaskInput(), // Widget to add new tasks
            Expanded(
                child: _tasks.isEmpty
                    ? Center(
                        child: Text(
                          'No tasks yet',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          return TaskItem(
                              task: _tasks[index],
                              onToggle: () => _toggleTaskCompletion(index),
                              onDelete: () => _deleteTask(index));
                        })),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskInput() {
    TextEditingController _controller = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter a task',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _addTask(_controller.text);
                _controller.clear();
              }
            },
            child: Text('Add Task'))
      ],
    );
  }
}
