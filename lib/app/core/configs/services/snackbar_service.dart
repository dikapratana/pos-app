import 'package:flutter/material.dart';
import 'locator.dart';
import 'navigation_service.dart';

enum SnackbarType { success, error, warning, info }

class SnackbarService {
  final _nav = locator<NavigationService>();

  void show(String? message, {SnackbarType type = SnackbarType.info}) {
    final context = _nav.context;
    if (context == null) return;

    final color = switch (type) {
      SnackbarType.success => Colors.green,
      SnackbarType.error => Colors.redAccent,
      SnackbarType.warning => Colors.orangeAccent,
      SnackbarType.info => Colors.blueAccent,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
