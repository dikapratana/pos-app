import 'package:provider/single_child_widget.dart';
import 'auth/auth_provider.dart';

class AppProviders {
  static List<SingleChildWidget> list = [
    ...AuthProvider.list,
    // kalau ada provider lain, tambahkan di sini
  ];
}
