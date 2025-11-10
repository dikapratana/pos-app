part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocEvent {}

class LoginSubmit extends LoginBlocEvent {
  final LoginRequestModel payload;

  LoginSubmit(this.payload);
}
