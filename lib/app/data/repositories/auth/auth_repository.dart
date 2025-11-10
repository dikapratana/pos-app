import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/app_api.dart';
import '../../../core/network/dio_client.dart';
import '../../../features/auth/login/model/login_request_model.dart';
import '../../../features/auth/login/model/login_response_model.dart';
import '../../model/global/global_response_model.dart';

class AuthRepository {
  final DioClient dio = DioClient();

  Future<Either<GlobalResponseModel, LoginResponseModel>> login(
    LoginRequestModel payload,
  ) async {
    try {
      final result = await dio.post(AppApi.login);
      return Right(LoginResponseModel.fromJson(result.data));
    } on DioException catch (e) {
      return Left(GlobalResponseModel.fromJson(e.response!.data));
    }
  }
}
