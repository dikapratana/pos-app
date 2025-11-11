part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponseModel success) = _Success;
  const factory LoginState.error(GlobalResponseModel error) = _Error;
}
