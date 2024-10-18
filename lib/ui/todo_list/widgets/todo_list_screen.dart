import 'package:flutter/material.dart';
import 'package:todo_data_service/ui/todo_list/viewmodel/todo_list_viewmodel.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({
    super.key,
    required this.viewModel,
  });

  final TodoListViewModel viewModel;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return ListView.builder(
                itemCount: widget.viewModel.todos.length,
                itemBuilder: (context, index) {
                  final todo = widget.viewModel.todos[index];
                  return ListTile(
                    title: Text(todo.task),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => widget.viewModel.delete.execute(todo.id),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Add a new task',
                ),
              ),
            ),
            FilledButton.icon(
              onPressed: () => widget.viewModel.add.execute(_controller.text),
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
