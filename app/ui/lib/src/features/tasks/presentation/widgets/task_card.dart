import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntango/src/features/tasks/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap; // Optional tap callback

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
  });

  String _formatTimeRange() {
    final timeFormat = DateFormat.jm();
    return '${timeFormat.format(task.startDate)} - ${timeFormat.format(task.endDate)}';
  }

  String get badgeText {
    if (task.isCompleted) {
      return 'Completed';
    } else if (DateTime.now().isAfter(task.startDate) &&
        DateTime.now().isBefore(task.endDate)) {
      return 'In Progress';
    } else {
      return 'Pending';
    }
  }

  Color _badgeColor(BuildContext context) {
    if (task.isCompleted) {
      return Theme.of(context).colorScheme.secondaryContainer;
    } else if (DateTime.now().isAfter(task.startDate) &&
        DateTime.now().isBefore(task.endDate)) {
      return Colors.amber;
    } else {
      return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with time range and badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTimeRange(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Chip(
                    label: Text(
                      badgeText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    backgroundColor: _badgeColor(context),
                  )
                ],
              ),
              const SizedBox(height: 8),
              // Task title
              Text(
                task.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              // Task description
              Text(
                task.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
