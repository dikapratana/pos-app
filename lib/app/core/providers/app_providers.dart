import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_resto_app/app/core/providers/auth/auth_provider.dart';
import 'package:pos_resto_app/app/features/auth/login/bloc/login/login_bloc_bloc.dart';

class AppProviders {
  static List<BlocProvider> list = [...AuthProvider.list];
}
