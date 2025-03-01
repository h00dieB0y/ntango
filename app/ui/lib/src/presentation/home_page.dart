import 'package:flutter/material.dart';
import 'package:ntango/src/constants/app_assets.dart';
import 'package:ntango/src/features/tasks/presentation/widgets/tasks_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AppAssets.logo,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            Text(
              'Ntango',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const TasksList(),
          Center(
            child: Text(
              'Settings Page Coming Soon...',
              style: textTheme.titleLarge?.copyWith(
                // Italicize the text
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add action for FAB
        },
        tooltip: 'Add Task',
        backgroundColor: theme.colorScheme.secondary,
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
        currentIndex: _selectedIndex,
        backgroundColor: theme.colorScheme.primary,
        selectedItemColor: theme.colorScheme.onPrimary,
        unselectedItemColor: theme.colorScheme.onPrimary.withValues(alpha: 0.5),
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}