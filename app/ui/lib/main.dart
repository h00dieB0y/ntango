import 'package:flutter/material.dart';
import 'package:ntango/src/features/tasks/presentation/pages/tasks_page.dart';

void main() {
  runApp(const NtangoApp());
}

class NtangoApp extends StatelessWidget {
  const NtangoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ntango',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TasksPage(),
    );
  }
}
