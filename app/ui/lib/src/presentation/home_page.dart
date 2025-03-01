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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          'Ntango',
          style: textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
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