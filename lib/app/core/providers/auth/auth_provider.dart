import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_resto_app/app/features/auth/login/bloc/login/login_bloc_bloc.dart';

import '../../../data/repositories/auth/auth_repository.dart';

class AuthProvider {
  static List<BlocProvider> list = [
    BlocProvider(create: (context) => LoginBlocBloc(AuthRepository())),
  ];
}
