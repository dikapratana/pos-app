import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  Future<void> navigateTo(String routeName) async {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<void> clearAndNavigate(String routeName) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void pop() {
    navigatorKey.currentState?.pop();
  }

  String? get currentRoute => ModalRoute.of(context!)?.settings.name;
}
