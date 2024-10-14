import '../../business/model/todo.dart';
import '../../utils/result.dart';

class TodoRepository {
  Future<Result<List<Todo>>> fetchTodos() async {
    return Result.error(Exception('Not implemented'));
  }

  Future<Result<Todo>> createTodo(String task) async {
    return Result.error(Exception('Not implemented'));
  }

  Future<Result<void>> deleteTodo(int id) async {
    return Result.error(Exception('Not implemented'));
  }
}
