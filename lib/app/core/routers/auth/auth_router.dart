import 'package:go_router/go_router.dart';

import '../../../features/auth/login/screens/login_screen.dart';

class AuthRouter {
  static List<RouteBase> routes = [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
  ];
}
