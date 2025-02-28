

class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.isCompleted = false,
  });
}
