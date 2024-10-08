import 'package:flutter/material.dart';
import 'package:todo_data_service/ui/theme_button/viewmodel/theme_button_viewmodel.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.viewmodel,
  });

  final ThemeButtonViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, _) {
          return Switch(
            value: viewmodel.isDarkMode,
            onChanged: (_) {
              viewmodel.toggleTheme();
            },
          );
        },
      ),
    );
  }
}
