part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocState {}

final class Initial extends LoginBlocState {}

final class Loading extends LoginBlocState {}

final class Success extends LoginBlocState {
  final LoginResponseModel response;
  Success(this.response);
}

final class Error extends LoginBlocState {
  final GlobalResponseModel response;
  Error(this.response);
}
