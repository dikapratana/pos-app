import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../../../data/repositories/auth/auth_repository.dart';
import '../../../features/auth/login/bloc/login/login_bloc.dart';

class AuthProvider {
  static List<SingleChildWidget> list = [
    BlocProvider(create: (context) => LoginBloc(AuthRepository())),
    // Tambahkan bloc auth lain di sini kalau ada
  ];
}
