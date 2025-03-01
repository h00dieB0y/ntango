import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntango/src/features/tasks/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;

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
    final colorScheme = Theme.of(context).colorScheme;
    if (task.isCompleted) {
      return colorScheme.secondaryContainer;
    } else if (DateTime.now().isAfter(task.startDate) &&
        DateTime.now().isBefore(task.endDate)) {
      // Using a theme-based amber alternative can be defined in your theme.
      return Colors.amber;
    } else {
      return colorScheme.primaryContainer;
    }
  }

  Color _badgeTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (task.isCompleted) {
      return colorScheme.onSecondary;
    } else {
      return colorScheme.onPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                    style: textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(style: BorderStyle.none),
                    ),
                    label: Text(
                      badgeText,
                      style: textTheme.bodySmall?.copyWith(
                        color: _badgeTextColor(context),
                      ),
                    ),
                    backgroundColor: _badgeColor(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Task title
              Text(
                task.title,
                style: textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              // Task description
              Text(
                task.description,
                style: textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
