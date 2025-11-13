import 'package:go_router/go_router.dart';
import 'package:pos_resto_app/app/core/routers/home/home_router.dart';

import '../configs/services/locator.dart';
import '../configs/services/navigation_service.dart';
import 'auth/auth_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: locator<NavigationService>().navigatorKey,

    initialLocation: '/login',
    routes: <RouteBase>[...AuthRouter.routes, ...HomeRouter.routes],
  );
}
