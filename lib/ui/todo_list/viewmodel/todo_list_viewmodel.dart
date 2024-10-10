import 'package:flutter/foundation.dart';
import 'package:todo_data_service/utils/command.dart';
import 'package:todo_data_service/utils/result.dart';

class TodoListViewModel extends ChangeNotifier {
  TodoListViewModel() {
    load = Command0<void>(_load);
    add = Command1<void, String>(_add);
    delete = Command1<void, int>(_delete);
  }

  /// Load Todo items from repository.
  late Command0<void> load;

  /// Add a new Todo item.
  late Command1<void, String> add;

  /// Delete a Todo item by its id.
  late Command1<void, int> delete;

  Future<Result<void>> _load() async {
    return Result.ok(null);
  }

  Future<Result<void>> _add(String task) async {
    return Result.ok(null);
  }

  Future<Result<void>> _delete(int id) async {
    return Result.ok(null);
  }
}
