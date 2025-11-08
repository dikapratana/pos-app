import 'package:go_router/go_router.dart';

import '../../../features/home/screens/home_screen.dart';

class HomeRouter {
  static List<RouteBase> routes = [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  ];
}
