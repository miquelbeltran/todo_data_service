import 'package:flutter/material.dart';
import 'package:todo_data_service/data/services/shared_preferences_service.dart';

import 'data/repositories/theme_repository.dart';
import 'main_app_viewmodel.dart';
import 'ui/theme_button/viewmodel/theme_button_viewmodel.dart';
import 'ui/theme_button/widgets/theme_button.dart';
import 'ui/todo_list/todo_list_screen.dart';

void main() {
  runApp(
    MainApp(
      themeRepository: ThemeRepository(
        SharedPreferencesService(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.themeRepository,
  });

  final ThemeRepository themeRepository;

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
            ThemeButton(
              viewmodel: ThemeButtonViewModel(
                widget.themeRepository,
              ),
            )
          ],
          title: const Text('Todo List'),
        ),
        body: const TodoListScreen(),
      ),
    );
  }
}
