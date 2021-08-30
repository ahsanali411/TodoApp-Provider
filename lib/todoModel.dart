import 'package:flutter/cupertino.dart';
import 'package:provider_todo_app/taskModel.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList(String title, String detail) {
    // TaskModel model = TaskModel('Title ${taskList.length}',
    //     'This is the task detail ${taskList.length}');
    TaskModel model = TaskModel(title, detail);
    taskList.add(model);
    notifyListeners();
    print("task length>>>>>>>>>>>> " + taskList.length.toString());
  }

  removeFromList(TaskModel taskModel) {
    taskList.removeWhere((element) =>
        element.title == taskModel.title && element.detail == taskModel.detail);
    notifyListeners();
  }
}
