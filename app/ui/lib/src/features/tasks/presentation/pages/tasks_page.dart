import 'package:flutter/material.dart';
import 'package:ntango/src/features/tasks/presentation/widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView(
        children: const [
          TaskCard(
            timeRange: '9:00 AM - 10:30 AM',
            title: 'Project Planning',
            subtitle: 'High Priority',
            badgeText: 'Focus Time',
          ),
          SizedBox(height: 16),
          TaskCard(
            timeRange: '11:00 AM - 12:00 PM',
            title: 'Daily Exercise',
            subtitle: 'Streak: 5 days',
            badgeText: 'Habit',
          ),
        ],
      ),
    );
  }
}
