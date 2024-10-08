import 'package:flutter/material.dart';

import 'data/repositories/ThemeRepository.dart';
import 'ui/theme_button/viewmodel/theme_button_viewmodel.dart';
import 'ui/theme_button/widgets/theme_button.dart';
import 'ui/todo_list/todo_list_screen.dart';

void main() {
  runApp(
    MainApp(
      themeRepository: ThemeRepository(),
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
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    widget.themeRepository.observeDarkMode().listen((isDarkMode) {
      // Using setState for demo purposes.
      // In a real app, use a state management solution.
      setState(() {
        _darkMode = isDarkMode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: _HomeScreen(
        themeRepository: widget.themeRepository,
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({
    required this.themeRepository,
  });

  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ThemeButton(
            viewmodel: ThemeButtonViewModel(themeRepository),
          )
        ],
        title: const Text('Todo List'),
      ),
      body: const TodoListScreen(),
    );
  }
}
