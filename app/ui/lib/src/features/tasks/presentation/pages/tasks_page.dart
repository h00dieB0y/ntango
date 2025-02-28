import 'package:flutter/material.dart';
import 'package:ntango/src/features/tasks/data/models/task_model.dart';
import 'package:ntango/src/features/tasks/data/repositories/task_repository.dart';
import 'package:ntango/src/features/tasks/presentation/widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: FutureBuilder<List<TaskModel>>(
        future: TaskRepository.getAllTask(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No tasks found'),
            );
          } else {
            final tasks = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16),
              itemBuilder: (context, index) => TaskCard(task: tasks[index]),
            );
          }
        },
      ),
    );
  }
}
