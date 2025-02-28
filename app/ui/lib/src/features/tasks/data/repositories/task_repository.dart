
import 'package:ntango/src/features/tasks/data/models/task_model.dart';

class TaskRepository {

  static Future<List<TaskModel>> getAllTask() async {
    // Mock data
    return [
      TaskModel(
        id: '1',
        title: 'Task 1',
        description: 'Description 1',
        startDate: DateTime.now().add(Duration(hours: 1)),
        endDate: DateTime.now().add(Duration(hours: 2)),
        isCompleted: false,
      ),
      TaskModel(
        id: '2',
        title: 'Task 2',
        description: 'Description 2',
        startDate: DateTime.now().add(Duration(hours: 2, minutes: 30)),
        endDate: DateTime.now().add(Duration(hours: 3)),
        isCompleted: false,
      ),
      TaskModel(
        id: '3',
        title: 'Task 3',
        description: 'Description 3',
        startDate: DateTime.now().add(Duration(hours: 3, minutes: 30)),
        endDate: DateTime.now().add(Duration(hours: 4, minutes: 0)),
        isCompleted: false,
      ),
    ];
  }

}
