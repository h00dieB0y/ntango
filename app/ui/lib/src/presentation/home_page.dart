import 'package:flutter/material.dart';
import 'package:ntango/src/constants/app_assets.dart';
import 'package:ntango/src/features/tasks/presentation/pages/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppAssets.logo),
        title: const Text('Ntango'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: const TasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {

        },
      ),
    );
  }
}