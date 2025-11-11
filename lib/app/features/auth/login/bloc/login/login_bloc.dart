import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/global/global_response_model.dart';
import '../../../../../data/repositories/auth/auth_repository.dart';
import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(_Initial()) {
    on<_Submit>((event, emit) async {
      emit(_Loading());
      final result = await authRepository.login(event.payload);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
