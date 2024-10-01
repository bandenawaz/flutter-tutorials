import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

final taskProvider = StateNotifierProvider<TaskManager, List<Task>>((ref) {
  return TaskManager();
});

class TaskManager extends StateNotifier<List<Task>> {
  TaskManager() : super([]);

  void addTask(String taskName) {
    final task = Task(id: UniqueKey().toString(), name: taskName);
    state = [...state, task]; // Update state with new task
  }

  void editTask(String id, String newName) {
    state = [
      for (final task in state)
        if (task.id == id) Task(id: id, name: newName) else task
    ]; // Update the task's name
  }

  void deleteTask(String id) {
    state = state.where((task) => task.id != id).toList(); // Remove the task
  }
}
