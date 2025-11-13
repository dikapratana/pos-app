import 'package:get_it/get_it.dart';
import 'navigation_service.dart';
import 'snackbar_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // ✅ Global services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
}
