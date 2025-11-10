import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_resto_app/app/data/model/global/global_response_model.dart';

import '../../../../../data/repositories/auth/auth_repository.dart';
import '../../model/login_request_model.dart';
import '../../model/login_response_model.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  AuthRepository authRepository;
  LoginBlocBloc(this.authRepository) : super(Initial()) {
    on<LoginSubmit>((event, emit) async {
      emit(Loading());
      final result = await authRepository.login(event.payload);
      result.fold((l) => emit(Error(l)), (r) => emit(Success(r)));
    });
  }
}
