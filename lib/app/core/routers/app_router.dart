import 'package:go_router/go_router.dart';
import 'package:pos_resto_app/app/core/routers/home/home_router.dart';

import 'auth/auth_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[...AuthRouter.routes, ...HomeRouter.routes],
  );
}
