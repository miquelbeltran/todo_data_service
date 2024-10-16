import 'package:flutter/material.dart';
import 'package:todo_data_service/data/repositories/todo_repository.dart';
import 'package:todo_data_service/data/services/database_service.dart';
import 'package:todo_data_service/data/services/shared_preferences_service.dart';
import 'package:todo_data_service/ui/todo_list/viewmodel/todo_list_viewmodel.dart';

import 'data/repositories/theme_repository.dart';
import 'main_app_viewmodel.dart';
import 'ui/theme_config/viewmodel/theme_switch_viewmodel.dart';
import 'ui/theme_config/widgets/theme_switch.dart';
import 'ui/todo_list/todo_list_screen.dart';

void main() {
  runApp(
    MainApp(
      themeRepository: ThemeRepository(
        SharedPreferencesService(),
      ),
      todoRepository: TodoRepository(
        database: DatabaseService(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.themeRepository,
    required this.todoRepository,
  });

  final ThemeRepository themeRepository;
  final TodoRepository todoRepository;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late MainAppViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = MainAppViewModel(widget.themeRepository);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          theme: _viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ThemeSwitch(
              viewmodel: ThemeSwitchViewModel(
                widget.themeRepository,
              ),
            )
          ],
          title: const Text('Todo List'),
        ),
        body: TodoListScreen(
          viewModel: TodoListViewModel(
            todoRepository: widget.todoRepository,
          ),
        ),
      ),
    );
  }
}
